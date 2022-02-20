import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50.0,
      lineWidth: 7,
      percent: 0.65,
      center: Text(
        '08:20h',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold
        )
      ),
      progressColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.grey.shade200
    );
  }
}