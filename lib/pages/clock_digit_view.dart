import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/widgets.dart';

class ClockDigitView extends StatelessWidget {
  const ClockDigitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SizedBox(
          width: double.infinity,
          child: FittedBox(child: ElapsedTimeText()),
        ),
      ),
    );
  }
}
