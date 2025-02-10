Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}