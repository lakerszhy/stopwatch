import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:stopwatch/entities/entities.dart';
import 'package:stopwatch/widgets/widgets.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchCubit, Lap>(
      builder: (context, state) {
        if (state.isRunning) {
          return ActionButton(
            onPressed: () => context.read<StopwatchCubit>().toggle(),
            text: '停止',
            textColor: Colors.red,
          );
        } else {
          return ActionButton(
            onPressed: () => context.read<StopwatchCubit>().toggle(),
            text: '启动',
            textColor: Colors.green,
          );
        }
      },
    );
  }
}
