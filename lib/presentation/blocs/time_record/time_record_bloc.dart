import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/infrastructure/repositories/time_record.dart';

part 'time_record_event.dart';

class TimeRecordBloc extends Bloc<TimeRecordEvent, TimeRecordModel> {
  final TimeRecordRepository _timeRecordRepository;

  TimeRecordBloc(TimeRecordModel timeRecordModel, this._timeRecordRepository) : super(timeRecordModel) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerStopped>(_onTimerStopped);
  }

  void _onTimerStarted(TimerStarted event, Emitter<TimeRecordModel> emitter) {
    TimeRecordModel updatedState = state.copyWith(
      status: TimeRecordStatus.started,
      date: DateTime.now(),
      startDate: DateTime.now()
    );

    _timeRecordRepository.add(updatedState);
    emit(updatedState);
  }

  void _onTimerStopped(TimerStopped event, Emitter<TimeRecordModel> emitter) {
    TimeRecordModel updatedState = state.copyWith(
      status: TimeRecordStatus.finished,
      stopDate: DateTime.now(),
      totalTimeInMs: Jiffy(state.stopDate).diff(state.startDate).toInt()
    );

    _timeRecordRepository.put(updatedState.key.toString(), updatedState);
    emit(TimeRecordModel.initial);
  }
}
