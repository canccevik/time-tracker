import 'package:flutter/material.dart';

// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';

import 'package:time_tracker/presentation/screens/app.dart';
import 'package:time_tracker/presentation/constants/themes.dart';
import 'package:time_tracker/domain/models/settings/settings.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsModelAdapter());

  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: AppThemes.lightTheme,
      home: const App(),
    ) 
  );
}
