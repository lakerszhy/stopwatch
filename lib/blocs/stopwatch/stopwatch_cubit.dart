import 'package:bloc/bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/entities/entities.dart';

class StopwatchCubit extends Cubit<Lap> {
  final Ticker ticker;

  StopwatchCubit({required this.ticker}) : super(Lap.initial());

  void elapse(Duration duration) {
    emit(state.elapse(duration));
  }

  void toggle() {
    if (state.isRunning) {
      ticker.stop();
    } else {
      ticker.start();
    }
    emit(state.toggle());
  }

  void reset() {
    if (state.isRunning) {
      return;
    }
    ticker.stop();
    emit(Lap.initial());
  }
}
