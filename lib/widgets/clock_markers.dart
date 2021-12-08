import 'dart:math';

import 'package:flutter/material.dart';

const _ticksCount = 300;

class ClockMarkers extends StatelessWidget {
  final double radius;

  const ClockMarkers({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < _ticksCount; i++)
          Positioned(
            left: radius,
            top: radius,
            child: _TickMarker(seconds: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: _TextMark(radius: radius, value: i),
          )
      ],
    );
  }
}

class _TickMarker extends StatelessWidget {
  final int seconds;
  final double radius;

  final _width = 2.0;

  Color? get _color => seconds % 25 == 0 ? Colors.white : Colors.grey[700];
  double get _height => seconds % 5 == 0 ? 14 : 8;

  const _TickMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-_width / 2, -_height / 2, 0.0)
        ..rotateZ(pi * 2 * seconds / _ticksCount)
        ..translate(0.0, radius - _height / 2, 0.0),
      child: Container(
        width: _width,
        height: _height,
        color: _color,
      ),
    );
  }
}

class _TextMark extends StatelessWidget {
  final int value;
  final double radius;

  final _width = 40.0;
  final _height = 30.0;

  const _TextMark({
    Key? key,
    required this.value,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-_width / 2, -_height / 2, 0.0)
        ..rotateZ(pi * 2 * value / 60 + pi)
        ..translate(0.0, radius - 36, 0.0)
        ..rotateZ(pi - 2 * pi * value / 60),
      child: SizedBox(
        width: _width,
        height: _height,
        child: Center(
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
