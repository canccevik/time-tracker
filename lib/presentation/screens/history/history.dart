import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_tracker/presentation/blocs/time/time_bloc.dart';
import 'package:time_tracker/presentation/blocs/time/time_state.dart';
import 'package:time_tracker/presentation/screens/history/history_tile.dart';
import 'package:time_tracker/domain/models/time_record/time_record.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        Iterable<TimeRecordModel?> dailyRecords = state.dailyRecords;

        return ListView.builder(
          itemCount: dailyRecords.length,
          itemBuilder: (ctx, i) {
            TimeRecordModel? dailyRecord = dailyRecords.elementAt(i);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: HistoryTile(
                date: dailyRecord!.date!,
                startDate: dailyRecord.startDate!,
                stopDate: dailyRecord.stopDate!,
                totalTimeInMs: dailyRecord.totalTimeInMs
              ),
            );
          }
        );
      }
    );
  }
}
