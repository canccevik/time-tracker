import 'package:flutter/material.dart';

class CircleTimeInfo extends StatelessWidget {
  final Size size;
  final IconData iconData;
  final String time;
  final TextStyle textStyle;

  const CircleTimeInfo({
    required this.size,
    required this.iconData,
    required this.time,
    required this.textStyle,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(90))
          ),
          child: Icon(iconData),
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: textStyle
        )
      ],
    );
  }
}
