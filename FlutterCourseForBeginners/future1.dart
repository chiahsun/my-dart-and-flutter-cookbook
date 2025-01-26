Future<int> getMultiple(int a, int m) {
  return Future.delayed(Duration(seconds: 3), () => a * m);
}

void test() async {
  print(3);
  print(await getMultiple(2, 7));
  print(4);
}

void main() {
  print(1);
  Future.delayed(Duration(seconds: 2), () { print(7); });
  print(2);

  test();
}