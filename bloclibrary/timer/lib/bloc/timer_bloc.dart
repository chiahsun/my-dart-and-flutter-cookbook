import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timer/ticker.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart'; // Since timer_event is part of timer_bloc, we can use private class
part 'timer_state.dart'; // timer_state is imported here, and we include equatable as above

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(ticker.ticks)) {
    on<StartTimer>(_onStarted);
    on<_TickTimer>(_onTicked);
    on<PauseTimer>(_onPaused);
    on<ResetTimer>(_onReset);
    on<ResumeTimer>(_onResume);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  int get duration => _ticker.ticks;

  void _onStarted(StartTimer event, Emitter<TimerState> emit) {
    emit(TimerRunning(duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick()
        .listen((duration) => add(_TickTimer(duration: duration)));
  }

  void _onTicked(_TickTimer event, Emitter<TimerState> emit) {
    emit(event.duration > 0
        ? TimerRunning(event.duration)
        : const TimerComplete());
  }

  void _onPaused(PauseTimer event, Emitter<TimerState> emit) {
    if (state is TimerRunning) {
      _tickerSubscription?.pause();
      emit(TimerPause(state.duration));
    }
  }

  void _onResume(ResumeTimer event, Emitter<TimerState> emit) {
    if (state is TimerPause) {
      _tickerSubscription?.resume();
      emit(TimerRunning(state.duration));
    }
  }

  void _onReset(ResetTimer event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(duration));
  }
}
