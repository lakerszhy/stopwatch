import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/widgets.dart';

class ClockDialView extends StatelessWidget {
  const ClockDialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = min(constraints.maxWidth, constraints.maxHeight) / 2;
      return Stack(
        children: [
          ClockMarkers(radius: radius),
          const Align(
            alignment: Alignment(0, 0.3),
            child: ElapsedTimeText(),
          ),
          ClockHand(radius: radius, thickness: 2),
        ],
      );
    });
  }
}
