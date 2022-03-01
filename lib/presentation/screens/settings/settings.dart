import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/screens/settings/settings_tile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
                List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                List<String> workingPeriods = ['Weekly', 'Monthly'];
                List<String> dailyWorkingHours = List<String>.generate(24, (i) => (i + 1).toString());

                return Column(
                  children: [
                    SettingsTile(
                      title: 'First day of the week',
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
                        }
                      )
                    ),
                    SettingsTile(
                      title: 'Working period',
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
                      title: 'Daily working hours',
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
                        }
                      )
                    ),
                    SettingsTile(
                      title: 'I am freelancer',
                      child: Checkbox(
                        value: state.isFlexibleWorker,
                        onChanged: (val) {
                          settingsBloc.add(IsFlexibleWorkerUpdated(val!));
                        }
                      )
                    )
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
