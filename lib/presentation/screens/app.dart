// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_timeline_trendway/date_picker_widget.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/domain/models/time_record/time_record.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/blocs/time_record/time_record_bloc.dart';
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

  var screens = const [Home(), History()];
  
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
          child: _buildDatePicker(context),
          preferredSize: const Size(100, 90)
        ) : null,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: IndexedStack(
            index: currentScreenIndex,
            children: screens,
          )
        )
      ),
      bottomNavigationBar: _buildNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return BlocBuilder<TimeRecordBloc, TimeRecordModel>(
      builder: (context, state) {
        return FloatingActionButton(
          child: state.status != TimeRecordStatus.started ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
          onPressed: () {
            var timeRecordBloc = context.read<TimeRecordBloc>();

            if (state.status != TimeRecordStatus.started) {
              timeRecordBloc.add(TimerStarted());
            }
            else {
              timeRecordBloc.add(TimerStopped());
            }
          }
        );
      }
    );
  }

  DateTime _getMostRecentWeekday(DateTime date, int weekday) {
    return DateTime(date.year, date.month, date.day - (date.weekday - (weekday + 1)) % 7);
  }

  Widget _buildDatePicker(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsModel>(
      builder: (context, state) {
        return DatePicker(
          _getMostRecentWeekday(DateTime.now(), state.firstDayOfTheWeek),
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

  Widget _buildNavbar() {
    return BottomNavigationBar(
      currentIndex: currentScreenIndex,
      onTap: (i) {
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
