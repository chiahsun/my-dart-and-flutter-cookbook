import 'package:flutter_test/flutter_test.dart';
import 'package:timer/timer/bloc/timer_bloc.dart';

void main() {
  group('Timer initial', () {
    test('Support value comparison', () {
      expect(TimerInitial(5), TimerInitial(5));
      // https://stackoverflow.com/questions/59100937/how-to-test-not-equal-with-matcher-in-flutter
      expect(TimerInitial(5), isNot(equals(TimerInitial(6))));
    });
  });

  group('Timer running', () {
    test('Support value comparison', () {
      expect(TimerRunning(5), TimerRunning(5));
      expect(TimerRunning(5), isNot(equals(TimerRunning(6))));
    });
  });

  group('Timer pause', () {
    test('Support value comparison', () {
      expect(TimerPause(5), TimerPause(5));
      expect(TimerPause(5), isNot(equals(TimerPause(6))));
    });
  });

  group('Timer complete', () {
    test('Support value comparison', () {
      expect(TimerComplete(), TimerComplete());
    });
  });
}