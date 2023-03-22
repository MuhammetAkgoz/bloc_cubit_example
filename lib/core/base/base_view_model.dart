import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseViewModel] a base of all view model classes
class BaseViewModel<T extends BaseState> extends Cubit<T> {
  late final NavigationHandler navigator;
  BuildContext? _context;

  BaseViewModel(super.initialState) {
    navigator = NavigationHandler.instance;
  }

  /// [onInit] does not run any [StatelessWidget]
  void onInit() {
    print('${runtimeType.toString()} created');
  }

  /// [onClose] does not run any [StatelessWidget]
  void onClose() {
    print('${runtimeType.toString()} closed');
  }

  void setBuildContext(BuildContext context) {
    print("${runtimeType.toString()} has ${context.widget}'s context");
    _context = context;
  }

  /// [context] not be null cause used before on closed
  BuildContext get context {
    if (_context == null) throw Exception("${context.widget}'s context is null");
    return _context!;
  }
}
