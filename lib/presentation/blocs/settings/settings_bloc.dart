import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/infrastructure/repositories/settings.dart';

part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsModel> {
  final SettingsRepository _settingsRepository;

  SettingsBloc(SettingsModel settingsModel, this._settingsRepository) : super(settingsModel) {
    on<FirstDayOfTheWeekUpdated>(_onFirstDayOfTheWeekUpdated);
    on<WorkingPeriodUpdated>(_onWorkingPeriodUpdated);
    on<DailyWorkingHoursUpdated>(_onDailyWorkingHoursUpdated);
    on<IsFlexibleWorkerUpdated>(_onIsFlexibleWorkerUpdated);
  }

  void _onFirstDayOfTheWeekUpdated(FirstDayOfTheWeekUpdated event, Emitter<SettingsModel> emit) {
    SettingsModel updatedState = state.copyWith(firstDayOfTheWeek: event.firstDayOfTheWeek);

    emit(updatedState);
    _settingsRepository.put('settings', updatedState);
  }

  void _onWorkingPeriodUpdated(WorkingPeriodUpdated event, Emitter<SettingsModel> emit) {
    SettingsModel updatedState = state.copyWith(workingPeriod: event.workingPeriod);

    emit(updatedState);
    _settingsRepository.put('settings', updatedState);
  }

  void _onDailyWorkingHoursUpdated(DailyWorkingHoursUpdated event, Emitter<SettingsModel> emit) {
    SettingsModel updatedState = state.copyWith(dailyWorkingHours: event.dailyWorkingHours);

    emit(updatedState);
    _settingsRepository.put('settings', updatedState);
  }

  void _onIsFlexibleWorkerUpdated(IsFlexibleWorkerUpdated event, Emitter<SettingsModel> emit) {
     SettingsModel updatedState = state.copyWith(isFlexibleWorker: event.isFlexibleWorker);

    emit(updatedState);
    _settingsRepository.put('settings', updatedState);
  }
}
