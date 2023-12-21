
void main() {
  final flybyObjects = {
    "balloon",
    "airplane"
  };

  flybyObjects.where((name) => name.contains('air')).forEach(print);
}