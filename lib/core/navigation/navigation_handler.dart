import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> pushNamed({String? path, Object? data});
  Future<void> pushNamedAndRemoveUntil({String? path, Object? data});
  void pop();
}

class NavigationHandler implements INavigationService {
  NavigationHandler._init();
  static final NavigationHandler _instance = NavigationHandler._init();

  static NavigationHandler get instance => _instance;

  /// [navigatorKey] is a [GlobalKey]
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Clear all root
  bool Function(Route<dynamic> route) get clearRoutes => (Route<dynamic> route) => false;

  @override
  Future<void> pushNamed({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> pushNamedAndRemoveUntil({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, clearRoutes, arguments: data);
  }

  @override
  void pop() => navigatorKey.currentState!.pop();
}
