import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timer/ticker.dart';

class MockTicker extends Mock implements Ticker {}

void main() {
  group(Ticker, () {
    late Ticker mockTicker;

    setUp(() {
      mockTicker = MockTicker();
      when(() => mockTicker.tick()).thenAnswer(
        (_) => Stream<int>.fromIterable([4, 3, 2, 1, 0]),
      );
    });

    test('Ticker emits 3 ticks', () async {
      expectLater(Ticker(3).tick(), emitsInOrder(<int>[2, 1, 0]));
    });

    test('Mock ticker emits 5 ticks', () async {
      expectLater(mockTicker.tick(), emitsInOrder(<int>[4, 3, 2, 1, 0]));
    });
  });
}
