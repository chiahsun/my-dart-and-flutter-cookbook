import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timer/timer/bloc/timer_bloc.dart';
import 'package:timer/timer/view/timer_page.dart';

class MockTimerBloc extends MockBloc<TimerEvent, TimerState>
    implements TimerBloc {}

extension on WidgetTester {
  Future<void> pumpTimerView(TimerBloc timerBloc) => pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: timerBloc,
            child: const TimerView(),
          ),
        ),
      );
}

void main() {
  group('TimerPage', () {
    testWidgets('Render TimerView', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TimerPage()));
      expect(find.byType(TimerView), findsOneWidget);
    });
  });

  group('TimerView', () {
    late TimerBloc timerBloc;

    setUp(() {
      timerBloc = MockTimerBloc();
    });

    testWidgets('Render initial TimerView', (tester) async {
      when(() => timerBloc.state).thenReturn(const TimerInitial(60));
      // Since we use this pumpWidget repeatedly, we can extract it to a extension of WidgetTester, say pumpTimerView.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: timerBloc,
            child: const TimerView(),
          ),
        ),
      );
      expect(find.text('01:00'), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });

    testWidgets('Render pause and reset buttons when the timer is running', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerRunning(59));
        await tester.pumpTimerView(timerBloc);
        expect(find.text('00:59'), findsOneWidget);
        expect(find.byIcon(Icons.pause), findsOneWidget);
        expect(find.byIcon(Icons.replay), findsOneWidget);
    });

    testWidgets('Render resume and reset buttons when the timer is paused', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerPause(59));
        await tester.pumpTimerView(timerBloc);
        expect(find.text('00:59'), findsOneWidget);
        expect(find.byIcon(Icons.play_arrow), findsOneWidget);
        expect(find.byIcon(Icons.replay), findsOneWidget);
    });

    testWidgets('Render reset button when the timer is completed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerComplete());
        await tester.pumpTimerView(timerBloc);
        expect(find.text('00:00'), findsOneWidget);
        expect(find.byIcon(Icons.replay), findsOneWidget);
    });

    testWidgets('Start timer when the start button is pressed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerInitial(60));
        await tester.pumpTimerView(timerBloc);
        await tester.tap(find.byIcon(Icons.play_arrow));
        verify(() => timerBloc.add(const StartTimer(duration: 60))).called(1);
    });

    testWidgets('Pause timer when the pause button is pressed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerRunning(59));
        await tester.pumpTimerView(timerBloc);
        await tester.tap(find.byIcon(Icons.pause));
        verify(() => timerBloc.add(const PauseTimer())).called(1);
    });

    testWidgets('Resume timer when the resume button is pressed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerPause(59));
        await tester.pumpTimerView(timerBloc);
        await tester.tap(find.byIcon(Icons.play_arrow));
        verify(() => timerBloc.add(const ResumeTimer())).called(1);
    });

    testWidgets('Reset timer when the reset button is pressed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerRunning(59));
        await tester.pumpTimerView(timerBloc);
        await tester.tap(find.byIcon(Icons.replay));
        verify(() => timerBloc.add(const ResetTimer())).called(1);
    });

   testWidgets('Reset timer when the reset button is pressed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerPause(59));
        await tester.pumpTimerView(timerBloc);
        await tester.tap(find.byIcon(Icons.replay));
        verify(() => timerBloc.add(const ResetTimer())).called(1);
    });

    testWidgets('Reset timer when the reset button is pressed', (tester) async {
        when(() => timerBloc.state).thenReturn(const TimerComplete());
        await tester.pumpTimerView(timerBloc);
        await tester.tap(find.byIcon(Icons.replay));
        verify(() => timerBloc.add(const ResetTimer())).called(1);
    });

 
    // TODO: Actions are not rebuilt when the timer is running
  });
}
