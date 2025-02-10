import 'package:bloc_example/bloc_example.dart' as bloc_example;
import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter_bloc.dart';
import 'package:bloc_example/counter_cubit.dart';
import 'package:bloc_example/simple_bloc_observer.dart';

Future<void> main(List<String> arguments) async {
  // print('Hello world: ${bloc_example.calculate()}!');

  // test1();
  // test2();
  // testError();
  // testBloc1();
  // testBloc2();
  // testBloc3();
  testBlocObserver();
}

// https://bloclibrary.dev/bloc-concepts/

Future<void> test1() async {
  final cubit = CounterCubit();
  final subscription = cubit.stream.listen(print);
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}

Future<void> test2() async {
  Bloc.observer = SimpleBlocObserver();
  CounterCubit()..increment()..close();
}

Future<void> testError() async {
  Bloc.observer = SimpleBlocObserver();
  CounterCubit()..incrementWithError()..close();
}

Future<void> testBloc1() async {
  final bloc = CounterBloc();
  print(bloc.state);
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  print(bloc.state);
  await bloc.close();
}

Future<void> testBloc2() async {
  final bloc = CounterBloc();
  final subscription = bloc.stream.listen(print);
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await bloc.close();
}

void testBloc3() {
  CounterBloc()
    ..add(CounterIncrementPressed())
    ..close();
}

void testBlocObserver() {
  Bloc.observer = SimpleBlocObserver();
  CounterBloc()
    ..add(CounterIncrementPressed())
    ..close();
}