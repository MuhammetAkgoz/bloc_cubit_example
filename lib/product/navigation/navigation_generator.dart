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
  third('/third');

  const MenuKey(this.key);

  final String key;
}

class NavigationGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == MenuKey.first.key) {
      return _navigate(const FirstView(), routeSettings);
    } else if (routeSettings.name == MenuKey.second.key) {
      return _navigate(
        BlocProvider<SecondViewModel>(
          create: (_) => SecondViewModel(),
          child: const SecondView(),
        ),
        routeSettings,
      );
    } else if (routeSettings.name == MenuKey.second.key) {
      return _navigate(
        BlocProvider<ThirdViewModel>(
          create: (_) => ThirdViewModel(),
          child: const ThirdView(),
        ),
        routeSettings,
      );
    } else {
      return undefinedRoute();
    }
  }

  static MaterialPageRoute<Widget> _navigate(
    Widget widget,
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          const Scaffold(body: Center(child: Text('No Route Found'))),
    );
  }
}
