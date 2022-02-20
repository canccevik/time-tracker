import 'package:flutter/material.dart';

class EditHistory extends StatefulWidget {
  const EditHistory({Key? key}) : super(key: key);

  @override
  State<EditHistory> createState() => _EditHistoryState();
}

class _EditHistoryState extends State<EditHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit History',
          style: Theme.of(context).textTheme.titleLarge
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryIconTheme.color
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}