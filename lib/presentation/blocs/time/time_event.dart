part of 'time_bloc.dart';

abstract class TimeEvent {}

class TimerStarted extends TimeEvent {}

class TimerStopped extends TimeEvent {}

class RecordsLoaded extends TimeEvent {}
