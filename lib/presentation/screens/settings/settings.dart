import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                SettingsTile(
                  title: 'First day of the week',
                  child: DropdownButton<String>(
                    value: 'Monday',
                    items: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (i) {}
                  )
                ),
                SettingsTile(
                  title: 'Working period',
                  child: DropdownButton<String>(
                    value: 'Weekly',
                    items: ['Weekly', 'Monthly'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (i) {}
                  )
                ),
                SettingsTile(
                  title: 'Daily working hours',
                  child: DropdownButton<String>(
                    value: '9',
                    items: List<String>.generate(24, (i) => (i + 1).toString()).map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (i) {}
                  )
                ),
                SettingsTile(
                  title: 'I am freelancer',
                  child: Checkbox(
                    value: false,
                    onChanged: (val) {}
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
