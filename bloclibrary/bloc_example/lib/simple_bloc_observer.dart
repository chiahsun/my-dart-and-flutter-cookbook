import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print('Observer: ${bloc.runtimeType} $change +++');
    super.onChange(bloc, change);
    print('Observer: ${bloc.runtimeType} $change ---');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition +++');
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition ---');
  }

   @override
  void onEvent(Bloc bloc, Object? event) {
    print('${bloc.runtimeType} $event +++');
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event ---');
  }
}