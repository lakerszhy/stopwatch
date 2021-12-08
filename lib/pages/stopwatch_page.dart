import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:stopwatch/widgets/widgets.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  late final StopwatchCubit _stopwatchCubit;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      _stopwatchCubit.elapse(elapsed);
    });

    _stopwatchCubit = StopwatchCubit(ticker: _ticker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _stopwatchCubit,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.8,
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 16,
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  final radius =
                      min(constraints.maxWidth, constraints.maxHeight) / 2;
                  return Stack(
                    children: [
                      ClockDial(radius: radius),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: StartStopButton(),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: ResetLapButton(),
                      ),
                    ],
                  );
                }),
              ),
            ),
            const Divider(height: 32),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    _stopwatchCubit.close();
    super.dispose();
  }
}
