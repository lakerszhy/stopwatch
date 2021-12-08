part of 'stopwatch_cubit.dart';

class StopwatchState extends Equatable {
  final Duration previouslyElapsed;
  final Duration currentlyElapsed;
  final bool isRunning;

  const StopwatchState({
    required this.previouslyElapsed,
    required this.currentlyElapsed,
    required this.isRunning,
  });

  factory StopwatchState.initial() => const StopwatchState(
        previouslyElapsed: Duration.zero,
        currentlyElapsed: Duration.zero,
        isRunning: false,
      );

  Duration get totalElapsed => previouslyElapsed + currentlyElapsed;

  @override
  List<Object> get props => [
        previouslyElapsed,
        currentlyElapsed,
        isRunning,
      ];

  StopwatchState copyWith({
    Duration? previouslyElapsed,
    Duration? currentlyElapsed,
    bool? isRunning,
  }) {
    return StopwatchState(
      previouslyElapsed: previouslyElapsed ?? this.previouslyElapsed,
      currentlyElapsed: currentlyElapsed ?? this.currentlyElapsed,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
