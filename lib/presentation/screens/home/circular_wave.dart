// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class CircularWave extends StatefulWidget {
  const CircularWave({Key? key}) : super(key: key);

  @override
  State<CircularWave> createState() => _CircularWaveState();
}

class _CircularWaveState extends State<CircularWave> {
  double waterHeight = 0.0;

  WaterController waterController = WaterController();

  @override
  Widget build(BuildContext context) {
    return WaveProgressBar(
      flowSpeed: 1,
      waveDistance: 45,
      waveHeight: 20,
      waterColor: Theme.of(context).primaryColor,
      strokeCircleColor: Colors.grey.shade200,
      heightController: waterController,
      percentage: waterHeight,
      size: const Size(250, 250),
      textStyle: Theme.of(context).textTheme.displayLarge
    );
  }
}