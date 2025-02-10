import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter_bloc.dart';

// https://pub.dev/packages/rxdart
import 'package:rxdart/rxdart.dart'; // For debounceTime

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}


class DebounceBloc extends Bloc<CounterEvent, int> {
  DebounceBloc() : super(0) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(state + 1),
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }
}