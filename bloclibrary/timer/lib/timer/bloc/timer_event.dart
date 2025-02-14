part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class StartTimer extends TimerEvent {
  const StartTimer({required this.duration});
  final int duration;
}

final class PauseTimer extends TimerEvent {
  const PauseTimer();
}

final class ResumeTimer extends TimerEvent {
  const ResumeTimer();
}

final class ResetTimer extends TimerEvent {
  const ResetTimer();
}

class _TickTimer extends TimerEvent {
  final int duration;
  const _TickTimer({required this.duration});
}