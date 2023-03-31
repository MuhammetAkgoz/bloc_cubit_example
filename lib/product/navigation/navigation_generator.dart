import 'package:bloc_cubit_example/core/base/view/view_state_builder.dart';
import 'package:bloc_cubit_example/view/first/first_view.dart';
import 'package:bloc_cubit_example/view/second/second_view.dart';
import 'package:bloc_cubit_example/view/second/second_view_model.dart';
import 'package:bloc_cubit_example/view/third/third_view.dart';
import 'package:bloc_cubit_example/view/third/third_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class Routes {
  const Routes._();

  static const String first = '/';
  static const String second = '/second';
  static const String third = '/third';
}

class NavigationGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.first:
        return _navigate(
          const FirstView(),
          routeSettings,
        );
      case Routes.second:
        return _navigate(
          BlocProvider<SecondViewModel>(
            create: (_) => SecondViewModel(),
            child: const SecondView(),
          ),
          routeSettings,
        );
      case Routes.third:
        return _navigate(
          BlocProvider<ThirdViewModel>(
            create: (_) => ThirdViewModel(),
            child: const ThirdView(),
          ),
          routeSettings,
        );
      default:
        return _undefinedRoute();
    }
  }

  static MaterialPageRoute<Widget> _navigate(Widget widget, RouteSettings settings) {
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
