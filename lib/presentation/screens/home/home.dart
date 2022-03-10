import 'package:flutter/material.dart';

import 'package:time_tracker/presentation/screens/home/circular_wave.dart';
import 'package:time_tracker/presentation/screens/home/info_container.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        CircularWave(),
        const SizedBox(height: 25),
        const InfoContainer()
      ]
    );
  }
}
