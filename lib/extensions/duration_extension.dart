extension DurationText on Duration {
  String toText() {
    final hundreds = (inMilliseconds ~/ 10) % 100;
    final seconds = inSeconds % 60;
    final minutes = inMinutes % 60;
    final hundredsStr = hundreds.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr.$hundredsStr';
  }
}
