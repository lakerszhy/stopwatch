import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:stopwatch/entities/entities.dart';
import 'package:stopwatch/widgets/widgets.dart';

class ResetLapButton extends StatelessWidget {
  const ResetLapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchCubit, Lap>(
      builder: (context, state) {
        if (state.isRunning) {
          return ActionButton(
            // TODO: 实现计次功能
            onPressed: () {},
            text: '计次',
            textColor: Colors.white,
          );
        } else if (state.totalElapsed == Duration.zero) {
          return ActionButton(
            text: '计次',
            textColor: Colors.white.withOpacity(0.5),
          );
        } else {
          return ActionButton(
            onPressed: () => context.read<StopwatchCubit>().reset(),
            text: '复位',
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
