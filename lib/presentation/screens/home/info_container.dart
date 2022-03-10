import 'package:flutter/material.dart';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_state.dart';
import 'package:time_tracker/presentation/constants/i18n/strings.g.dart';
import 'package:time_tracker/presentation/widgets/circle_time_info.dart';
import 'package:time_tracker/domain/models/time_record/time_record_status/time_record_status.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({Key? key}) : super(key: key);

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  final CustomTimerController timerController = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<TimeBloc, TimeState>(
            listener: (context, state) {
              if (state.currentRecord.status == TimeRecordStatus.started) {
                return timerController.start();
              }
              timerController.pause();
            },
            builder: (context, state) {
              if (state.dailyRecords.isEmpty) {
                return const SizedBox();
              }
              
              TimeRecordModel? currentDayRecord = state.dailyRecords.first!;
              String additionalTimeStr = Jiffy(DateTime.fromMillisecondsSinceEpoch(state.additionalTimeInMs.abs()).toUtc()).Hm;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTimer(
                    controller: timerController,
                    begin: Duration(milliseconds: currentDayRecord.totalTimeInMs),
                    end: const Duration(hours: 2),
                    builder: (time) {
                      return Text(
                        "${time.hours}:${time.minutes}:${time.seconds}",
                        style: Theme.of(context).textTheme.headlineLarge
                      );
                    }
                  ),
                  Text(
                    additionalTimeStr + t.common.symbolOfHour,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: state.additionalTimeInMs > 0 ? Colors.green : Colors.red
                    )
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleTimeInfo(
                        size: const Size(45, 45),
                        iconData: Icons.timer,
                        time: Jiffy(currentDayRecord.startDate).Hm,
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500
                        )
                      ),
                      CircleTimeInfo(
                        size: const Size(45, 45),
                        iconData: Icons.flag,
                        time: Jiffy(currentDayRecord.stopDate).Hm,
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500
                        )
                      )
                    ],
                  )
                ],
              );
            }
          )
        ),
      ),
    );
  }
}
