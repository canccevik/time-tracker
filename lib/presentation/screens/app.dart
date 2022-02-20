// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:date_picker_timeline_trendway/date_picker_widget.dart';

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
      backgroundColor: const Color(0xfff5f7f9),
      appBar: AppBar(
        title: const Text(
          'Time Tracker',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w500
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.black),
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
          child: buildDatePicker(),
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

  DateTime mostRecentSunday(DateTime date) => DateTime(date.year, date.month, date.day - date.weekday % 7);

  Widget buildDatePicker() {
    return DatePicker(
      mostRecentSunday(DateTime.now()),
      initialSelectedDate: DateTime.now(),
      daysCount: 7,
      height: 90,
      selectionColor: const Color(0xff5f80f5),
      selectedTextColor: Colors.white,
      onDateChange: (date) {}
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
