class Pair<T, U> {
  final T value1;
  final U value2;

  Pair({required this.value1, required this.value2});

  @override
  String toString() {
    return '($value1, $value2)';
  }
}

class Pair2<T> {
  final T value1, value2;

  Pair2({required this.value1, required this.value2});

  @override
  String toString() {
    return '($value1, $value2)';
  }
}



void main() {
  print(Pair(value1: 1, value2: 'One'));

  // print(Pair2<int>(value1: 1, value2: 2));
  print(Pair2(value1: 'Good', value2: 'Bad'));
}