import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/widgets.dart';

class ClockDial extends StatelessWidget {
  final double radius;

  const ClockDial({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClockMarkers(radius: radius),
        const Align(
          alignment: Alignment(0, 0.35),
          child: ElapsedTimeText(),
        ),
        ClockHand(radius: radius, thickness: 2),
      ],
    );
  }
}
