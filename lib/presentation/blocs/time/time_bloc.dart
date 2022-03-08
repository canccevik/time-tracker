import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:collection/collection.dart';

import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/domain/models/time_record/time_record_status/time_record_status.dart';
import 'package:time_tracker/infrastructure/repositories/time_record.dart';
import 'package:time_tracker/presentation/blocs/time/time_state.dart';

part 'time_event.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final TimeRecordRepository timeRecordRepository;

  TimeBloc({
    required TimeRecordModel timeRecordModel,
    required this.timeRecordRepository
  }) : super(TimeState(currentRecord: timeRecordModel)) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerStopped>(_onTimerStopped);
    on<RecordsLoaded>(_onRecordsLoaded);
  }

  Future<void> _onTimerStarted(TimerStarted event, Emitter<TimeState> emit) async {
    DateTime now = DateTime.now();

    TimeRecordModel timeRecordModel = TimeRecordModel(
      status: TimeRecordStatus.started,
      date: DateTime(now.year, now.month, now.day),
      startDate: now
    );
    
    TimeRecordModel? timeRecord = await timeRecordRepository.add(timeRecordModel);
    emit(state.copyWith(currentRecord: timeRecord));
  }

  Future<void> _onTimerStopped(TimerStopped event, Emitter<TimeState> emit) async {
    TimeRecordModel timeRecordModel = state.currentRecord;

    timeRecordModel.status = TimeRecordStatus.finished;
    timeRecordModel.stopDate = DateTime.now();
    timeRecordModel.totalTimeInMs = Jiffy(state.currentRecord.stopDate).diff(state.currentRecord.startDate).toInt();
    
    await timeRecordRepository.put(timeRecordModel.key, timeRecordModel);

    emit(state.copyWith(currentRecord: TimeRecordModel.initial));
    add(RecordsLoaded());
  }

  void _onRecordsLoaded(RecordsLoaded event, Emitter<TimeState> emit) {
    Iterable<TimeRecordModel?> timeRecords = timeRecordRepository.getAll();
    List<TimeRecordModel?> dailyRecords = <TimeRecordModel>[];
    var groupedRecords = groupBy(timeRecords, (TimeRecordModel? model) => model!.date);
    
    groupedRecords.forEach((_, _records) => _records.sort((a, b) => a!.startDate!.compareTo(b!.startDate!)));

    groupedRecords.forEach((date, _records) {
      int totalTimeInMs = 0;

      for (TimeRecordModel? record in _records) {
        totalTimeInMs += record!.totalTimeInMs;
      }
      
      TimeRecordModel model = TimeRecordModel(
        date: date,
        startDate: _records.first!.startDate,
        stopDate: _records.last!.stopDate,
        totalTimeInMs: totalTimeInMs
      );
      dailyRecords.add(model);
    });
    emit(state.copyWith(dailyRecords: dailyRecords));
  }
}
