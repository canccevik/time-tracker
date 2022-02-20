import 'package:flutter/material.dart';

import 'package:custom_timer/custom_timer.dart';

import 'package:time_tracker/widgets/circle_time_info.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({Key? key}) : super(key: key);

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  final CustomTimerController controller = CustomTimerController();

  @override
  void initState() {
    controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTimer(
                controller: controller,
                begin: const Duration(seconds: 0),
                end: const Duration(hours: 2),
                builder: (time) {
                  return Text(
                    "${time.hours}:${time.minutes}:${time.seconds}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    )
                  );
                }
              ),
              const Text(
                '-01:40h',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleTimeInfo(
                    size: Size(45, 45),
                    iconData: Icons.timer,
                    time: '09:00',
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  CircleTimeInfo(
                    size: Size(45, 45),
                    iconData: Icons.flag,
                    time: '18:00',
                    textStyle: TextStyle(
                      fontSize: 16,
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