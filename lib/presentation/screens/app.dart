// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_timeline_trendway/date_picker_widget.dart';
import 'package:jiffy/jiffy.dart';

import 'package:time_tracker/domain/models/settings/settings.dart';
import 'package:time_tracker/domain/models/time_record/time_record_status/time_record_status.dart';
import 'package:time_tracker/presentation/blocs/settings/settings_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_state.dart';
import 'package:time_tracker/presentation/constants/i18n/strings.g.dart';
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

  List<Widget> screens = const [Home(), History()];
  
  late Widget activeScreen;

  DatePickerController datePickerController = DatePickerController();

  void setJiffyLocale() async {
    await Jiffy.locale(LocaleSettings.currentLocale.flutterLocale.languageCode);
  }

  @override
  void initState() {
    setJiffyLocale();
    activeScreen = screens[0];
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => datePickerController.animateToSelection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.common.appName,
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
                  MaterialPageRoute(builder: (context) => Settings())
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
      floatingActionButton: currentScreenIndex == 0 ? _buildFloatingActionButton(context) : null,
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        return FloatingActionButton(
          child: state.currentRecord.status != TimeRecordStatus.started ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
          onPressed: () {
            TimeBloc timeRecordBloc = context.read<TimeBloc>();

            if (state.currentRecord.status != TimeRecordStatus.started) {
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

  DateTime _getStartDateOfDatePicker(DateTime date, int workingPeriod, int firstDayOfTheWeek) {
    return DateTime(date.year, date.month, workingPeriod == 1 ? 1 : date.day - (date.weekday - (firstDayOfTheWeek + 1)) % 7);
  }

  List<DateTime> _getEnabledDates(DateTime startDate, int workingPeriod) {
    int daysCount = DateTimeRange(start: startDate, end: DateTime.now()).duration.inDays + 1;
    int dayToStart = workingPeriod == 0 ? startDate.day : 1;
    return List.generate(daysCount, (i) => DateTime(startDate.year, startDate.month, i + dayToStart));
  }

  Widget _buildDatePicker(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsModel>(
      listener: (context, state) {
        datePickerController.animateToSelection();
      },
      builder: (context, state) {
        DateTime now = DateTime.now();
        DateTime startDate = _getStartDateOfDatePicker(DateTime.now(), state.workingPeriod, state.firstDayOfTheWeek);
        int daysCount = state.workingPeriod == 0 ?  7 : DateTime(now.year, now.month + 1, 0).day;
        
        return DatePicker(
          startDate,
          initialSelectedDate: DateTime.now(),
          locale: TranslationProvider.of(context).flutterLocale.languageCode,
          daysCount: daysCount,
          controller: datePickerController,
          height: 90,
          selectionColor: Theme.of(context).primaryColor,
          selectedTextColor: Theme.of(context).iconTheme.color,
          enabledDates: _getEnabledDates(startDate, state.workingPeriod),
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
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: t.common.home
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.history),
          label: t.common.history
        )
      ],
    );
  }
}
