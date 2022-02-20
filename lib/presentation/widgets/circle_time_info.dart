import 'package:flutter/material.dart';

class CircleTimeInfo extends StatefulWidget {
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
  State<CircleTimeInfo> createState() => _CircleTimeInfoState();
}

class _CircleTimeInfoState extends State<CircleTimeInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.size.width,
          height: widget.size.height,
          decoration: const BoxDecoration(
            color: Color(0xff5f80f5),
            borderRadius: BorderRadius.all(Radius.circular(90))
          ),
          child: Icon(widget.iconData, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          widget.time,
          style: widget.textStyle
        )
      ],
    );
  }
}