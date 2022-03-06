import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/infrastructure/repositories/time_record.dart';
import 'package:time_tracker/presentation/blocs/time_record/time_record_state.dart';

part 'time_record_event.dart';

class TimeRecordBloc extends Bloc<TimeRecordEvent, TimeRecordState> {
  final TimeRecordRepository _timeRecordRepository;

  TimeRecordBloc(TimeRecordModel timeRecordModel, this._timeRecordRepository) : super(
    TimeRecordState(timeRecord: timeRecordModel)
  ) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerStopped>(_onTimerStopped);
  }

  void _onTimerStarted(TimerStarted event, Emitter<TimeRecordState> emitter) {
    TimeRecordModel timeRecordModel = state.timeRecord.copyWith(
      status: TimeRecordStatus.started,
      date: DateTime.now(),
      startDate: DateTime.now()
    );

    _timeRecordRepository.add(timeRecordModel);
    emit(state.copyWith(timeRecord: timeRecordModel));
  }

  void _onTimerStopped(TimerStopped event, Emitter<TimeRecordState> emitter) {
    TimeRecordModel timeRecordModel = state.timeRecord.copyWith(
      status: TimeRecordStatus.finished,
      stopDate: DateTime.now(),
      totalTimeInMs: Jiffy(state.timeRecord.stopDate).diff(state.timeRecord.startDate).toInt()
    );

    _timeRecordRepository.put(timeRecordModel.key.toString(), timeRecordModel);
    emit(state.copyWith(timeRecord: TimeRecordModel.initial));
  }
}
