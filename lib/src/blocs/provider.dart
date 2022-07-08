import 'package:flutter/material.dart';
import 'package:vendease_test/src/blocs/app_nav_bloc.dart';

class BlocProvider extends InheritedWidget {
  final appNavBloc = AppNavBloc();

  BlocProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppNavBloc appNav(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<BlocProvider>())!
        .appNavBloc;
  }
}