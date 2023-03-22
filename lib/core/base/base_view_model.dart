import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseViewModel] a base of all view model classes
class BaseViewModel<T extends BaseState> extends Cubit<T> {
  late final NavigationHandler navigator;
  Map<String, dynamic>? _args;

  BaseViewModel(super.initialState) {
    navigator = NavigationHandler.instance;
  }

  /// [onInit] does not run any [StatefulWidget]
  void onInit() {}

  /// [onClose] does not run any [StatefulWidget]
  void onClose() {}

  /// [didUpdateWidget] does not run any [StatefulWidget]
  void didUpdateWidget(StatefulWidget oldWidget) {}

  void setArgs(Map<String, dynamic>? data) {
    _args = data;
  }

  dynamic get arg => _args?['args'];
}
