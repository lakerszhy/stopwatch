import 'package:equatable/equatable.dart';

class Lap extends Equatable {
  final Duration previouslyElapsed;
  final Duration currentlyElapsed;
  final bool isRunning;

  const Lap._({
    required this.previouslyElapsed,
    required this.currentlyElapsed,
    required this.isRunning,
  });

  factory Lap.initial() => const Lap._(
        previouslyElapsed: Duration.zero,
        currentlyElapsed: Duration.zero,
        isRunning: false,
      );

  Duration get totalElapsed => previouslyElapsed + currentlyElapsed;

  Lap toggle() {
    if (isRunning) {
      return copyWith(
        isRunning: false,
        currentlyElapsed: Duration.zero,
        previouslyElapsed: previouslyElapsed + currentlyElapsed,
      );
    } else {
      return copyWith(isRunning: true);
    }
  }

  Lap elapse(Duration elapsed) => copyWith(currentlyElapsed: elapsed);

  @override
  List<Object?> get props => [
        previouslyElapsed,
        currentlyElapsed,
        isRunning,
      ];

  Lap copyWith({
    Duration? previouslyElapsed,
    Duration? currentlyElapsed,
    bool? isRunning,
  }) {
    return Lap._(
      previouslyElapsed: previouslyElapsed ?? this.previouslyElapsed,
      currentlyElapsed: currentlyElapsed ?? this.currentlyElapsed,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
