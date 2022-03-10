part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class FirstDayOfTheWeekUpdated extends SettingsEvent {
  final int firstDayOfTheWeek;
  FirstDayOfTheWeekUpdated(this.firstDayOfTheWeek);
}

class WorkingPeriodUpdated extends SettingsEvent {
  final int workingPeriod;
  WorkingPeriodUpdated(this.workingPeriod);
}

class DailyWorkingHoursUpdated extends SettingsEvent {
  final int dailyWorkingHours;
  DailyWorkingHoursUpdated(this.dailyWorkingHours);
}

class IsFlexibleWorkerUpdated extends SettingsEvent {
  final bool isFlexibleWorker;
  IsFlexibleWorkerUpdated(this.isFlexibleWorker);
}

class AppLanguageUpdated extends SettingsEvent {
  final String appLanguage;
  AppLanguageUpdated(this.appLanguage);
}

