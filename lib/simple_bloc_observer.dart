import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  // the onTransaction method (of bloc not cubit) is called when the bloc changes state
  // it used only with bloc; in cases like the User logged Out you need to
  // check if the user is logged Out because he connected from another device
  // or he changed his password so he need to log in again,
  // or he just logged out

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   print(transition);
  // }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('change: $change');
  }
}
