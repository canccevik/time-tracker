// ignore_for_file: import_of_legacy_library_into_null_safe


import 'package:flutter/material.dart';

import 'package:time_tracker/presentation/screens/home/circular_wave.dart';
import 'package:time_tracker/presentation/screens/home/info_container.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 25),
        CircularWave(),
        SizedBox(height: 25),
        InfoContainer()
      ]
    );
  }
}