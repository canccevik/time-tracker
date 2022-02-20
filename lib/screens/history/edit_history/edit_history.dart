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
        title: const Text(
          'Edit History',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w500
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}