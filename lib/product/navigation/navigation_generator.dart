import 'package:bloc_cubit_example/view/first/first_view.dart';
import 'package:bloc_cubit_example/view/second/second_view.dart';
import 'package:flutter/material.dart';

@immutable
class Routes {
  const Routes._();

  static const String first = '/';
  static const String second = '/second';
}

class NavigationGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.first:
        return _navigate(const FirstView(), Routes.first);
      case Routes.second:
        return _navigate(const SecondView(), Routes.second);
      default:
        return undefinedRoute();
    }
  }

  static MaterialPageRoute _navigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('No Route Found'))));
  }
}
