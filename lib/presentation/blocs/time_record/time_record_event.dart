part of 'time_record_bloc.dart';

abstract class TimeRecordEvent {}

class TimerStarted extends TimeRecordEvent {}

class TimerStopped extends TimeRecordEvent {}

