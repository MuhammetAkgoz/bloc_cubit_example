import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
  void pop();
}

class NavigationHandler implements INavigationService {
  NavigationHandler._init();
  static final NavigationHandler _instance = NavigationHandler._init();
  static NavigationHandler get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  @override
  void pop() async => navigatorKey.currentState!.pop();
}
