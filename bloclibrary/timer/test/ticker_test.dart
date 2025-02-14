
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/ticker.dart';

void main() {
  group(Ticker, () {
    test('Ticker emits 3 ticks', () async {
      expectLater(Ticker().tick(ticks: 3), emitsInOrder(<int>[2, 1, 0]));
    });
  });
}