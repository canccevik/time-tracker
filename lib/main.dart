import 'package:flutter/material.dart';

import 'package:time_tracker/presentation/screens/app.dart';
import 'package:time_tracker/presentation/constants/themes.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: AppThemes.lightTheme,
      home: const App(),
    ) 
  );
}

