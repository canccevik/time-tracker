import 'package:flutter/material.dart';

import 'package:time_tracker/screens/history/history_tile.dart';


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, i) => const HistoryTile()
      ),
    );
  }
}
