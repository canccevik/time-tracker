import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingsTile({required this.title, required this.child, Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium
            ),
            child
          ],
        ),
      ),
    );
  }
}
