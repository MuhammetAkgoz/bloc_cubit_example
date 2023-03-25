import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseViewModel] a base of all view model classes
class BaseViewModel<T extends BaseState> extends Cubit<T> {
  /// [BaseViewModel] is a constructor method
  BaseViewModel(this.initialState) : super(initialState) {
    navigator = NavigationHandler.instance;
  }

  /// [navigator] enables you to manage routes
  late final NavigationHandler navigator;
  BuildContext? _context;
  T initialState;

  /// [onInit] cannot be run inside a [StatelessWidget]
  /// that has a viewModel.
  void onInit() {
    print('${toString()}: CREATED');
  }

  /// [onReady] cannot be run inside a [StatelessWidget]
  /// that has a viewModel.
  void onReady() {
    print('${toString()}: READY');
  }

  /// [onClose] cannot be run inside a [StatelessWidget]
  /// that has a viewModel.
  void onClose() {
    print('${toString()}: CLOSED');
  }

  /// [context] not be null cause used before on closed.
  /// [context] could not be used inside of a [StatelessWidget] that has a viewModel.
  /// [context] should not be called onInıt.
  BuildContext get context {
    if (_context == null) throw Exception('Context is not be null');
    return _context!;
  }

  /// [context] cannot be set when you called inside of a BaseStatelessView.
  /// it's not throw [Exception]
  set context(BuildContext? value) => _context = value;

  void load() => emit(state.copyWith(screenStatus: ScreenStatus.loading) as T);
  void fail() => emit(state.copyWith(screenStatus: ScreenStatus.error) as T);
  void init() => emit(state.copyWith(screenStatus: ScreenStatus.initial) as T);
  void empty() => emit(state.copyWith(screenStatus: ScreenStatus.empty) as T);
  void ready() {
    if (context.mounted) emit(state.copyWith(screenStatus: ScreenStatus.success) as T);
  }
}
