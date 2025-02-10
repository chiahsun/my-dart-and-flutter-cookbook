import 'package:bloc/bloc.dart';

// https://bloclibrary.dev/bloc-concepts/
class CounterCubit extends Cubit<int> {
  CounterCubit({int initialState = 0}) : super(initialState);

  void increment() => emit(state + 1);

  void incrementWithError() {
    addError(Exception('Increment error'), StackTrace.current);
    increment();
  }

  @override
  void onChange(Change<int> change) {
    print('In counter: $change +++');
    super.onChange(change);
    print('In counter: $change ---');
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    print('$error, $stackTrace');
    super.addError(error, stackTrace);
  }
}
