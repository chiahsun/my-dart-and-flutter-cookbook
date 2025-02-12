
import 'package:bloc_test/bloc_test.dart';
import 'package:counter/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

// https://github.com/felangel/bloc/blob/master/examples/flutter_counter/test/counter/cubit/counter_cubit_test.dart
void main() {
  group(CounterCubit, () {
    test('Initial state is 0', () {
      expect(CounterCubit().state, 0);
    });

    group('Increment', () {
      blocTest<CounterCubit, int>(
        'emits [1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[1],
      );

      blocTest<CounterCubit, int>(
        'emits [1] when add is invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..increment()..increment(),
        expect: () => const <int>[1, 2],
      );

       blocTest<CounterCubit, int>(
        'emits [42] when state is 41',
        build: CounterCubit.new,
        seed: () => 41,
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[42],
      );
    });

    // TODO: Decrement
  });
}