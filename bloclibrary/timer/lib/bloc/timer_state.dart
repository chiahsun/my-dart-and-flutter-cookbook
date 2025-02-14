part of 'timer_bloc.dart';


sealed class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object?> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerPause extends TimerState {
  const TimerPause(super.duration);

  @override
  String toString() => 'TimerPause { duration: $duration }';
}

// Note that since we implement Equatable
// If there are two consecutive TimerRunning with same duration
// then the listner side would receive once only
final class TimerRunning extends TimerState {
  const TimerRunning(super.duration);

  @override
  String toString() => 'TimerRunning { duration: $duration }';
}

class TimerComplete extends TimerState {
  const TimerComplete() : super(0);
}
