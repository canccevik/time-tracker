import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/presentation/constants/i18n/strings.g.dart';
import 'package:time_tracker/presentation/screens/settings/settings_tile.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  final List<String> days = [
    t.common.weekdays.monday,
    t.common.weekdays.tuesday,
    t.common.weekdays.wednesday,
    t.common.weekdays.thursday,
    t.common.weekdays.friday,
    t.common.weekdays.saturday,
    t.common.weekdays.sunday
  ];
  final Set<Map<String, String>> appLanguages = {
    {'name': t.common.languages.english.name, 'code': t.common.languages.english.code},
    {'name': t.common.languages.turkish.name, 'code': t.common.languages.turkish.code}
  };
  final List<String> workingPeriods = [t.settings.workingPeriods.weekly, t.settings.workingPeriods.monthly];
  final List<String> dailyWorkingHours = List<String>.generate(24, (i) => (i + 1).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.settings.title,
          style: Theme.of(context).textTheme.titleLarge
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<SettingsBloc, SettingsModel>(
              builder: (context, state) {
                SettingsBloc settingsBloc = context.read<SettingsBloc>();
                TimeBloc timeBloc = context.read<TimeBloc>();
                
                return Column(
                  children: [
                    SettingsTile(
                      title: t.settings.firstDayOfTheWeek,
                      child: DropdownButton<String>(
                        value: days.elementAt(state.firstDayOfTheWeek),
                        items: days.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (i) {
                          settingsBloc.add(FirstDayOfTheWeekUpdated(days.indexOf(i!)));
                          timeBloc.add(RecordsLoaded());
                        }
                      )
                    ),
                    SettingsTile(
                      title: t.settings.workingPeriod,
                      child: DropdownButton<String>(
                        value: workingPeriods.elementAt(state.workingPeriod),
                        items: workingPeriods.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (i) {
                          settingsBloc.add(WorkingPeriodUpdated(workingPeriods.indexOf(i!)));
                        }
                      )
                    ),
                    SettingsTile(
                      title: t.settings.dailyWorkingHours,
                      child: DropdownButton<String>(
                        value: state.dailyWorkingHours.toString(),
                        items: dailyWorkingHours.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (i) {
                          settingsBloc.add(DailyWorkingHoursUpdated(dailyWorkingHours.indexOf(i!) + 1));
                          timeBloc.add(RecordsLoaded());
                        }
                      )
                    ),
                    SettingsTile(
                      title: t.settings.iAmFreelancer,
                      child: Checkbox(
                        value: state.isFlexibleWorker,
                        onChanged: (val) {
                          settingsBloc.add(IsFlexibleWorkerUpdated(val!));
                        }
                      )
                    ),
                    SettingsTile(
                      title: t.settings.appLanguage,
                      child: DropdownButton<String>(
                        value: state.appLanguage,
                        items: appLanguages.map((language) {
                          return DropdownMenuItem(
                            child: Text(language['name'].toString()),
                            value: language['code']
                          );
                        }).toList(),
                        onChanged: (code) {
                          settingsBloc.add(AppLanguageUpdated(code!));
                          LocaleSettings.setLocaleRaw(code);
                        }
                      )
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
