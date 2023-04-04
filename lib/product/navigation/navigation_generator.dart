import 'package:bloc_cubit_example/core/base/view/view_state_builder.dart';
import 'package:bloc_cubit_example/view/first/first_view.dart';
import 'package:bloc_cubit_example/view/second/second_view.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:bloc_cubit_example/view/third/third_view.dart';
import 'package:bloc_cubit_example/view/third/third_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuKey {
  first('/'),
  main('/main'),
  second('/second'),
  third('/third'),
  none('');

  const MenuKey(this.key);
  final String key;

  static MenuKey getType(String? key) {
    try {
      return MenuKey.values.firstWhere((element) => element.key == key);
    } catch (e) {
      return none;
    }
  }
}

class NavigationGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final key = MenuKey.getType(routeSettings.name);

    switch (key) {
      case MenuKey.first:
        return _navigate(const FirstView(), routeSettings);
      case MenuKey.second:
        return _navigate(
          BlocProvider<SecondViewModel>(create: (_) => SecondViewModel(), child: const SecondView()),
          routeSettings,
        );
      case MenuKey.third:
        return _navigate(
          BlocProvider<ThirdViewModel>(create: (_) => ThirdViewModel(), child: const ThirdView()),
          routeSettings,
        );
      case MenuKey.main:
        return _navigate(const FirstView(), routeSettings);
      case MenuKey.none:
        return _undefinedRoute();
    }
  }

  static MaterialPageRoute<Widget> _navigate(
    Widget widget,
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider<ViewStateBloc>(
        create: (_) => ViewStateBloc(),
        child: widget,
      ),
      settings: settings,
    );
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
          body: Center(
        child: Text('No Route Found'),
      )),
    );
  }
}
