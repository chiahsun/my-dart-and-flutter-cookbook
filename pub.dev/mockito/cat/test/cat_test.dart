import 'package:cat/cat.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:mockito/annotations.dart';

// https://pub.dev/packages/mockito
// https://pub.dev/packages/mockito/example

@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat_test.mocks.dart';

class Cat {
  String sound() => "Meow!";
  bool eatFood(String food, {bool? hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() { }
  void hunt(String place, String prey) {}
  int lives = 9;
}



// https://pub.dev/packages/mockito/example


void main() {
  late Cat cat;
  setUp(() {
    cat = MockCat();
  });

  test("Let's verify", () {
    Cat cat = Cat();
    expect(cat.sound(), 'Meow!');
  });

  test("Try to mock", () {
    when(cat.sound()).thenReturn("Purr!");

    expect(cat.sound(), 'Purr!');
  });

}
