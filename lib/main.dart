import 'package:flutter/material.dart';

// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:time_tracker/presentation/screens/app.dart';
import 'package:time_tracker/presentation/constants/themes.dart';
import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/infrastructure/repositories/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/infrastructure/repositories/time_record.dart';
import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/domain/models/time_record/time_record_status/time_record_status.dart';
import 'package:time_tracker/presentation/constants/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  String appLanguage = initialSettings.appLanguage ?? LocaleSettings.useDeviceLocale().flutterLocale.languageCode;
  LocaleSettings.setLocaleRaw(appLanguage);
  initialSettings.appLanguage = appLanguage;

  runApp(
    TranslationProvider(
      child: MultiBlocProvider(
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
              timeRecordRepository: timeRecordRepository,
              settingsRepository: settingsRepository
            )..add(RecordsLoaded())
          )
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: LocaleSettings.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              title: t.common.appName,
              theme: AppThemes.lightTheme,
              home: const App()
            );
          }
        )
      ),
    )
  );
}
