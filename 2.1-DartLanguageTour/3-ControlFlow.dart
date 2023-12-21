
void main() {
  final flybyObjects = {
    (1, 2),
    {"balloon", "20m"},
    {"airplane", "2000m"},
    "some random string"
  };
  for (final object in flybyObjects) {
    print(object);
  }

  // https://dart.dev/language/branches
  for (final pair in flybyObjects) {
    if (pair case (int i, int k)) {
      print("Case pair: $i $k");
    }
  }

  // https://dart.dev/language/patterns
  for (final pair in flybyObjects) {
    if (pair case (int i, int k)) {
      print("Case pair: $i $k");
    }
  }

  // https://github.com/dart-lang/language/issues/207
  for (final object in flybyObjects) {
    if (object case Map) {
      print("Case map: $object.0 $object.1");
      print("Case map: $object.0 $object.1");
    }
  }
}