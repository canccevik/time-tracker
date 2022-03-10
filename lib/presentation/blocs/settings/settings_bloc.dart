import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/infrastructure/repositories/settings.dart';

part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsModel> {
  final SettingsRepository settingsRepository;

  SettingsBloc({required SettingsModel settingsModel, required this.settingsRepository}) : super(settingsModel) {
    on<FirstDayOfTheWeekUpdated>(_onFirstDayOfTheWeekUpdated);
    on<WorkingPeriodUpdated>(_onWorkingPeriodUpdated);
    on<DailyWorkingHoursUpdated>(_onDailyWorkingHoursUpdated);
    on<IsFlexibleWorkerUpdated>(_onIsFlexibleWorkerUpdated);
    on<AppLanguageUpdated>(_onAppLanguageUpdated);
  }

  void _onFirstDayOfTheWeekUpdated(FirstDayOfTheWeekUpdated event, Emitter<SettingsModel> emit) async {
    SettingsModel updatedSettings = state.copyWith(firstDayOfTheWeek: event.firstDayOfTheWeek);
    
    emit(updatedSettings);
    await settingsRepository.put('settings', updatedSettings);
  }

  void _onWorkingPeriodUpdated(WorkingPeriodUpdated event, Emitter<SettingsModel> emit) async {
    SettingsModel updatedSettings = state.copyWith(workingPeriod: event.workingPeriod);

    emit(updatedSettings);
    await settingsRepository.put('settings', updatedSettings);
  }

  void _onDailyWorkingHoursUpdated(DailyWorkingHoursUpdated event, Emitter<SettingsModel> emit) async {
    SettingsModel updatedSettings = state.copyWith(dailyWorkingHours: event.dailyWorkingHours);

    emit(updatedSettings);
    await settingsRepository.put('settings', updatedSettings);
  }

  void _onIsFlexibleWorkerUpdated(IsFlexibleWorkerUpdated event, Emitter<SettingsModel> emit) async {
    SettingsModel updatedSettings = state.copyWith(isFlexibleWorker: event.isFlexibleWorker);

    emit(updatedSettings);
    await settingsRepository.put('settings', updatedSettings);
  }

  void _onAppLanguageUpdated(AppLanguageUpdated event, Emitter<SettingsModel> emit) async {
    SettingsModel updatedSettings = state.copyWith(appLanguage: event.appLanguage);

    emit(updatedSettings);
    await settingsRepository.put('settings', updatedSettings);
  }
}
