// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_state.dart';

class CircularWave extends StatelessWidget {
  CircularWave({Key? key}) : super(key: key);

  final WaterController waterController = WaterController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsModel>(
      builder: (context, settingsState) {
        return BlocBuilder<TimeBloc, TimeState>(
          builder: (context, timeState) {
            if (timeState.dailyRecords.isEmpty) {
              return const SizedBox();
            }
      
            int dailyWorkingHours = settingsState.dailyWorkingHours;
            double dailyWorkingHoursInMs = dailyWorkingHours * 60 * 60 * 1000;
            double percentValue = ((timeState.dailyRecords.first!.totalTimeInMs / dailyWorkingHoursInMs) * 100) * 0.01;
            waterController.changeWaterHeight(percentValue);

            return WaveProgressBar(
              flowSpeed: 0.85,
              waveDistance: 45,
              waterColor: Theme.of(context).primaryColor,
              strokeCircleColor: Colors.grey.shade200,
              heightController: waterController,
              percentage: percentValue,
              size: const Size(250, 250),
              textStyle: Theme.of(context).textTheme.displayLarge
            );
          }
        );
      }
    );
  }
}
