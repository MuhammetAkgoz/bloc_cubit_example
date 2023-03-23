import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseViewModel] a base of all view model classes
class BaseViewModel<T extends BaseState> extends Cubit<T> {
  /// [BaseViewModel] is a constructor method
  BaseViewModel(super.initialState) {
    navigator = NavigationHandler.instance;
  }

  /// [navigator] enables you to manage routes
  late final NavigationHandler navigator;
  BuildContext? _context;

  /// [onInit] does not run any [StatelessWidget]
  void onInit() {
    print('${toString()}: CREATED');
  }

  /// [onReady] does not run any [StatelessWidget]
  void onReady() {
    print("${_context?.widget}'s context is ready");
    print('${toString()}: READY');
  }

  /// [onClose] does not run any [StatelessWidget]
  void onClose() {
    print('${toString()}: CLOSED');
  }

  /// [context] not be null cause used before on closed.
  /// [context] should not be called onInıt.
  BuildContext get context {
    if (_context == null) throw Exception('Context is not be null');
    return _context!;
  }

  set context(BuildContext value) => _context = value;
}
