import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';

part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  final Ticker ticker;

  StopwatchCubit({required this.ticker}) : super(StopwatchState.initial());

  void elapse(Duration duration) {
    emit(state.copyWith(currentlyElapsed: duration));
  }

  void toggle() {
    if (state.isRunning) {
      ticker.stop();
      emit(state.copyWith(
        isRunning: false,
        currentlyElapsed: Duration.zero,
        previouslyElapsed: state.previouslyElapsed + state.currentlyElapsed,
      ));
    } else {
      ticker.start();
      emit(state.copyWith(isRunning: true));
    }
  }

  void reset() {
    if (state.isRunning) {
      return;
    }
    ticker.stop();
    emit(StopwatchState.initial());
  }
}
