import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  final String title;
  final Widget child;

  const SettingsTile({required this.title, required this.child, Key? key}) : super(key: key);

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16
              ),
            ),
            widget.child
          ],
        ),
      ),
    );
  }
}