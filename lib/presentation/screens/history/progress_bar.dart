import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/constants/i18n/strings.g.dart';

class ProgressBar extends StatelessWidget {
  final int totalTimeInMs;

  const ProgressBar({required this.totalTimeInMs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsModel>(
      builder: (context, state) {
        String totalTimeStr = Jiffy(DateTime.fromMillisecondsSinceEpoch(totalTimeInMs).toUtc()).Hm;
        double dailyWorkingHoursInMs = state.dailyWorkingHours * 60 * 60 * 1000;
        double percentValue = totalTimeInMs / dailyWorkingHoursInMs;

        return CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 7,
          percent: percentValue > 1 ? 1 : percentValue,
          center: Text(
            totalTimeStr + t.common.symbolOfHour,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          progressColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.grey.shade200
        );
      }
    );
  }
}
