import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Observer is a class that helps you to observe the state of the blocs
class SimpleBlocObserver
    implements
        BlocObserver // I used implement to make the class force me to implement all the methods in the BlocObserver
{
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('chang = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
