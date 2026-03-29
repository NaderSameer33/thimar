import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverImplmentaion extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('this state is $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('the tranction is $transition');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('create a cubit $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('close cubit $bloc');
  }
}
