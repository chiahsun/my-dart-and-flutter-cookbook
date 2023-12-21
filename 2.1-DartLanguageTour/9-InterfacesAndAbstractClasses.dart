
import '5-Classes.dart';

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.name);

  @override
  void describe() {
    print("This is a mock space ship");
  }
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print("=======");
    describe();
    print("=======");
  }
}

class Painting extends Describable {
  @override
  void describe() {
    print("This is a painting");
  }
}

void main() {
  MockSpaceship("sample").describe();
  Painting p = Painting();
  p.describe();
  p.describeWithEmphasis();
}