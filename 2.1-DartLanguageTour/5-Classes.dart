
class Spacecraft {
  String name;
  DateTime? launchDate;

  Spacecraft(this.name, this.launchDate);

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');

    final launchDate = this.launchDate;
    if (launchDate != null) {
      print('Launched: ${launchDate.year}/${launchDate.month}');
    } else {
      print('Unlaunched');
    }
  }
}

void main() {
  // https://api.dart.dev/stable/3.2.3/dart-core/DateTime-class.html
  Spacecraft sc = Spacecraft("Apollo 11", DateTime(1969, 07));
  sc.describe();

  Spacecraft unknown = Spacecraft.unlaunched("Unknown");
  unknown.describe();
}