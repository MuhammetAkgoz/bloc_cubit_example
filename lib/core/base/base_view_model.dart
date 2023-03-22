import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseViewModel] a base of all view model classes
class BaseViewModel<T extends BaseState> extends Cubit<T> {
  BaseViewModel(super.initialState);

  /// [onInit] does not run any [StatefulWidget]
  void onInit() {}

  /// [onClose] does not run any [StatefulWidget]
  void onClose() {}

  /// [didUpdateWidget] does not run any [StatefulWidget]
  void didUpdateWidget(StatefulWidget oldWidget) {}
}
