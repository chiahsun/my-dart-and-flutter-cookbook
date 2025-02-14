import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timer/timer/bloc/timer_bloc.dart';
import 'package:timer/ticker.dart';

class MockTicker extends Mock implements Ticker {}

const testTicks = 5;

void main() {
  group('TimerBloc', () {
    late Ticker ticker;
    late Ticker mockTicker;

    setUp(() {
      ticker = Ticker(testTicks);
      mockTicker = MockTicker();
      when(() => mockTicker.tick()).thenAnswer(
        (_) => Stream<int>.fromIterable([4, 3, 2, 1, 0]),
      );
      when(() => mockTicker.ticks).thenReturn(testTicks);
    });

    test('Initial state', () async {
      expect(
        TimerBloc(ticker: mockTicker).state,
        TimerInitial(testTicks),
      );
    });

    // Real ticker would spend some time to emit but the mock one won't
    // This test don't wait so if real ticker is used, it would be cancelled which fails the test
    blocTest<TimerBloc, TimerState>(
      'emits 5 TimerRunning 5 times followed by TimerComplete when timer is started.',
      build: () => TimerBloc(ticker: mockTicker),
      act: (bloc) => bloc.add(const StartTimer(duration: testTicks)),
      expect: () => [
        TimerRunning(5),
        TimerRunning(4),
        TimerRunning(3),
        TimerRunning(2),
        TimerRunning(1),
        TimerComplete(),
      ],
      verify: (_) => verify(() => mockTicker.tick()).called(1),
    );

    // For real ticker, we need to wait
    blocTest<TimerBloc, TimerState>(
        'emits 5 TimerRunning 5 times followed by TimerComplete when timer is started for real ticker.',
        build: () => TimerBloc(ticker: ticker),
        act: (bloc) async {
          bloc.add(const StartTimer(duration: testTicks));
        },
        wait: const Duration(seconds: 5),
        expect: () => [
              TimerRunning(5),
              TimerRunning(4),
              TimerRunning(3),
              TimerRunning(2),
              TimerRunning(1),
              TimerComplete(),
            ]);

    blocTest<TimerBloc, TimerState>(
      'emits TimePaused when PauseTimer is added',
      build: () => TimerBloc(ticker: mockTicker),
      seed: () => TimerRunning(5),
      act: (bloc) => bloc.add(const PauseTimer()),
      expect: () => [TimerPause(5)],
    );

    blocTest<TimerBloc, TimerState>(
      'emits TimeRunning when ResumeTimer is added',
      build: () => TimerBloc(ticker: mockTicker),
      seed: () => TimerPause(5),
      act: (bloc) => bloc.add(const ResumeTimer()),
      expect: () => [TimerRunning(5)],
    );

    blocTest<TimerBloc, TimerState>(
      'emits TimeInitial when ResetTimer is added',
      build: () => TimerBloc(ticker: mockTicker),
      seed: () => TimerRunning(5),
      act: (bloc) => bloc.add(const ResetTimer()),
      expect: () => [TimerInitial(5)],
    );
  });
}
