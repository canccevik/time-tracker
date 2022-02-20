import 'package:flutter/material.dart';

import 'package:time_tracker/presentation/screens/history/edit_history/edit_history.dart';
import 'package:time_tracker/presentation/screens/history/progress_bar.dart';
import 'package:time_tracker/presentation/widgets/circle_time_info.dart';

class HistoryTile extends StatefulWidget {
  const HistoryTile({Key? key}) : super(key: key);

  @override
  State<HistoryTile> createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditHistory())
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '19 Feb 2022',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        )
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleTimeInfo(
                              size: const Size(35, 35),
                              iconData: Icons.timer,
                              time: '09:00',
                              textStyle: Theme.of(context).textTheme.labelLarge!
                            ),
                            CircleTimeInfo(
                              size: const Size(35, 35),
                              iconData: Icons.flag,
                              time: '18:00',
                              textStyle: Theme.of(context).textTheme.labelLarge!
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [ProgressBar()],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}