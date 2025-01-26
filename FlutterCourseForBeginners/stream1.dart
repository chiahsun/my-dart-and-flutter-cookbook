Stream<String> getName() {
  // return Stream.value('Foo');
  return Stream.periodic(const Duration(seconds: 1), (value) => 'Foo');
}

void test() async {
  await for (final value in getName()) {
    print(value);
  }
  print('Finished');
}


void main() {
  test();
}