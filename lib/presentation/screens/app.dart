// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_timeline_trendway/date_picker_widget.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/screens/home/home.dart';
import 'package:time_tracker/presentation/screens/history/history.dart';
import 'package:time_tracker/presentation/screens/settings/settings.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentScreenIndex = 0;

  Widget activeScreen = const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time Tracker',
          style: Theme.of(context).textTheme.titleLarge
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings())
                );
              }
            ),
          )
        ],
        bottom: currentScreenIndex == 0 ? PreferredSize(
          child: buildDatePicker(context),
          preferredSize: const Size(100, 90)
        ) : null,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: activeScreen
        )
      ),
      bottomNavigationBar: buildNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {}
      ),
    );
  }

  DateTime mostRecentWeekday(DateTime date, int weekday) => DateTime(date.year, date.month, date.day - (date.weekday - (weekday + 1)) % 7);

  Widget buildDatePicker(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsModel>(
      builder: (context, state) {
        return DatePicker(
          mostRecentWeekday(DateTime.now(), state.firstDayOfTheWeek),
          initialSelectedDate: DateTime.now(),
          daysCount: 7,
          height: 90,
          selectionColor: Theme.of(context).primaryColor,
          selectedTextColor: Theme.of(context).iconTheme.color,
          onDateChange: (date) {}
        );
      } 
    );
  }

  Widget buildNavbar() {
    return BottomNavigationBar(
      currentIndex: currentScreenIndex,
      onTap: (i) {
        var screens = {const Home(), const History()};
        setState(() {
          currentScreenIndex = i;
          activeScreen = screens.elementAt(i);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History'
        )
      ],
    );
  }
}
