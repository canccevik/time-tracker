// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class CircularWave extends StatefulWidget {
  const CircularWave({Key? key}) : super(key: key);

  @override
  State<CircularWave> createState() => _CircularWaveState();
}

class _CircularWaveState extends State<CircularWave> {
  double waterHeight = 0.8;

  WaterController waterController = WaterController();

  @override
  Widget build(BuildContext context) {
    return WaveProgressBar(
      flowSpeed: 1,
      waveDistance: 45,
      waveHeight: 20,
      waterColor: const Color(0xff5f80f5),
      strokeCircleColor: Colors.grey.shade200,
      heightController: waterController,
      percentage: waterHeight,
      size: const Size(250, 250),
      textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 60.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}