import 'package:flutter/material.dart';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/presentation/blocs/time_record/time_record_bloc.dart';

import 'package:time_tracker/presentation/widgets/circle_time_info.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<TimeRecordBloc, TimeRecordModel>(
                listener: (context, state) {
                  if (state.status == TimeRecordStatus.started) {
                    return timerController.start();
                  }
                  timerController.pause();
                },
                builder: (context, state) {
                  return CustomTimer(
                    controller: timerController,
                    begin: const Duration(seconds: 0),
                    end: const Duration(hours: 2),
                    builder: (time) {
                      return Text(
                        "${time.hours}:${time.minutes}:${time.seconds}",
                        style: Theme.of(context).textTheme.headlineLarge
                      );
                    }
                  );
                }
              ),
              Text(
                '00:00h',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleTimeInfo(
                    size: const Size(45, 45),
                    iconData: Icons.timer,
                    time: '00:00',
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500
                    )
                  ),
                  CircleTimeInfo(
                    size: const Size(45, 45),
                    iconData: Icons.flag,
                    time: '00:00',
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
