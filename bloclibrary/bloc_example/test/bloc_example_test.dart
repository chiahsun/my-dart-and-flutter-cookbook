import 'package:bloc_example/bloc_example.dart';
import 'package:bloc_example/counter_cubit.dart';
import 'package:bloc_example/sum_streams.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  // https://bloclibrary.dev/bloc-concepts/
  test('sum of stream', () async {
    var stream = countStream(10);
    var sum = await sumStream(stream);
    expect(sum, 55);
  });

  test('Cubit emit', () async {
    final cubit = CounterCubit();
    expect(cubit.state, 0);
    cubit.increment();
    expect(cubit.state, 1); 
    cubit.close();
  });
}
