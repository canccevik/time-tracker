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
import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/infrastructure/repositories/time_record.dart';
import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/domain/models/time_record/time_record_status/time_record_status.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsModelAdapter());
  Hive.registerAdapter(TimeRecordModelAdapter());
  Hive.registerAdapter(TimeRecordStatusAdapter());
  
  Box<SettingsModel> settingsBox = await Hive.openBox<SettingsModel>('settings');
  SettingsRepository settingsRepository = SettingsRepository(settingsBox);
  SettingsModel initialSettings = settingsRepository.get('settings') ?? SettingsModel.initial;

  Box<TimeRecordModel> timeRecordBox = await Hive.openBox<TimeRecordModel>('time_records');
  TimeRecordRepository timeRecordRepository = TimeRecordRepository(timeRecordBox);
  TimeRecordModel initialTimeRecord = TimeRecordModel.initial;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            settingsModel: initialSettings,
            settingsRepository: settingsRepository
          )
        ),
        BlocProvider<TimeBloc>(
          create: (context) => TimeBloc(
            timeRecordModel: initialTimeRecord,
            timeRecordRepository: timeRecordRepository
          )
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Time Tracker',
        theme: AppThemes.lightTheme,
        home: const App()
      )
    )
  );
}
