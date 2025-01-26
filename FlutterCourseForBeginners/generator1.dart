
Iterable<int> getOneTwoThree() sync* {
  for (int i = 1; i <= 3; ++i) yield i;
}

void test() async {
  for (final value in getOneTwoThree()) {
    print(value);
  }
}

void main() {
  print(getOneTwoThree());
  test();
}