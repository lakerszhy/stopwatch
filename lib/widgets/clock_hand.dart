import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/stopwatch/stopwatch_cubit.dart';

class ClockHand extends StatelessWidget {
  final double radius;
  final double thickness;

  const ClockHand({
    Key? key,
    required this.radius,
    this.thickness = 2,
  }) : super(key: key);

  final _trailingLength = 30.0;
  double get _dotRadius => thickness * 2;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: radius,
      child: BlocBuilder<StopwatchCubit, StopwatchState>(
        builder: (context, state) {
          return Transform(
            alignment: Alignment.bottomCenter,
            origin: Offset(0, -_trailingLength - _dotRadius),
            transform: Matrix4.identity()
              ..translate(-_dotRadius, 0.0, 0.0)
              ..rotateZ(2 * pi / 60000 * (state.totalElapsed.inMilliseconds)),
            child: _Hand(
              thickness: thickness,
              radius: radius,
              dotRadius: _dotRadius,
              trailingLength: _trailingLength,
            ),
          );
        },
      ),
    );
  }
}

class _Hand extends StatelessWidget {
  final double thickness;
  final double radius;
  final double dotRadius;
  final double trailingLength;

  const _Hand({
    Key? key,
    required this.thickness,
    required this.radius,
    required this.dotRadius,
    required this.trailingLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: thickness,
          height: radius - dotRadius,
          color: Colors.orange,
        ),
        Container(
          width: dotRadius * 2,
          height: dotRadius * 2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: thickness),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: thickness,
          height: trailingLength,
          color: Colors.orange,
        ),
      ],
    );
  }
}
