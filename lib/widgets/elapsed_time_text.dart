import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:stopwatch/entities/entities.dart';
import 'package:stopwatch/extensions/duration_extension.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchCubit, Lap>(
      builder: (context, state) {
        return Text(
          state.totalElapsed.toText(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        );
      },
    );
  }
}
