import 'package:cat/cat.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

// https://pub.dev/packages/mocktail/example

class Food {}

class Chicken extends Food {}

class Tuna extends Food {}

class Cat {
  String sound() => "Meow!";
  bool likes(String food, {bool isHungry = false}) => false;
  void eat<T extends Food>(T food) {}
  final int lives = 9;
}

class MockCat extends Mock implements Cat {}

void main() {
  group('cat', () {
    late Cat cat;

    setUp(() {
      cat = MockCat();
    });

    test('Mock', () {
      when(() => cat.sound()).thenReturn('purr');
      when(() => cat.lives).thenReturn(10);

      expect(cat.sound(), 'purr');
      verify(() => cat.sound()).called(1);
      expect(cat.lives, 10);
      verify(() => cat.lives).called(1);

      when(() => cat.likes('fish', isHungry: any(named: 'isHungry'))).thenReturn(true);
      expect(cat.likes('fish', isHungry: true), true);
      expect(cat.likes('fish', isHungry: false), true);
       verify(() => cat.likes('fish', isHungry: true)).called(1);
       verify(() => cat.likes('fish', isHungry: false)).called(1);
    });
  });
}
