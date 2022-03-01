import 'package:flutter/material.dart';

// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_tracker/presentation/screens/app.dart';
import 'package:time_tracker/presentation/constants/themes.dart';
import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/infrastructure/repositories/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsModelAdapter());

  Box<SettingsModel> settingsBox = await Hive.openBox<SettingsModel>('settings');
  SettingsRepository settingsRepository = SettingsRepository(settingsBox);
  SettingsModel initialSettings = settingsRepository.get('settings') ?? SettingsModel.initial;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: AppThemes.lightTheme,
      builder: (context, widget) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SettingsBloc>(
              create: (context) => SettingsBloc(initialSettings, settingsRepository)
            )
          ],
          child: widget!
        );
      },
      home: const App()
    )
  );
}
