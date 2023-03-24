import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Builder function for the the initial state.
typedef InitialBuilder = Widget Function(BuildContext context);

/// Builder function for the data loading state.
typedef LoadingBuilder = Widget Function(BuildContext context);

/// Builder function for a success state. The data was fetched and nonnull
/// element was returned.
typedef SuccessBuilder<T> = Widget Function(BuildContext context, T data);

/// Builder function for the data refreshing state. Can only occur after
/// [SuccessBuilder].
typedef RefreshingBuilder<T extends BaseState> = Widget Function(BuildContext context, T data);

/// Builder function for no result. The data was fetched
/// successfully, but a null element was returned.
typedef EmptyBuilder = Widget Function(BuildContext context);

/// Builder function for an error. It contains an [error] that has caused
/// which may allow a view to react differently on different errors.
typedef ErrorBuilder = Widget Function(
  BuildContext context,
  Object error,
);

/// Signature for the [buildWhen] function which takes the previous [ViewState]
/// and the current [ViewState] and returns a [bool] which determines whether
/// to rebuild the `view` with the current `state`.
typedef ViewStateBuilderCondition = bool Function(
  BaseState previous,
  BaseState current,
);

/// [ViewStateBuilder] is responsible for building the UI based on the [ViewState].
/// It's a wrapper over the [BlocBuilder] widget so it accepts a [bloc] object and
/// a set of handy callbacks, which corresponds to each possible state:
/// [onReady] builder for the the initial state,
/// [onLoading] builder for the data loading state,
/// [onRefreshing] builder for the data refreshing state,
/// [onSuccess] builder for the data success state,
/// [onEmpty] builder for for no result state,
/// [onError] builder function for an error state.
///
/// [T] - the type of items,
/// [B] - the type of bloc.
class ViewStateBuilder<T extends BaseState, B extends BlocBase<T>> extends BlocBuilder<B, T> {
  ViewStateBuilder({
    super.key,
    super.bloc,
    InitialBuilder? onReady,
    LoadingBuilder? onLoading,
    RefreshingBuilder<T>? onRefreshing,
    SuccessBuilder<T>? onSuccess,
    EmptyBuilder? onEmpty,
    ErrorBuilder? onError,
    ViewStateBuilderCondition? super.buildWhen,
  }) : super(
          builder: (BuildContext context, T state) {
            print('${state.screenStatus.name} çalıştı');
            if (state.screenStatus == ScreenStatus.initial) {
              return onReady?.call(context) ?? const SizedBox.shrink();
            } else if (state.screenStatus == ScreenStatus.loading) {
              return onLoading?.call(context) ?? const Center(child: CircularProgressIndicator());
            } else if (state.screenStatus == ScreenStatus.refreshing) {
              return onRefreshing?.call(context, state) ?? const SizedBox.shrink();
            } else if (state.screenStatus == ScreenStatus.success) {
              return onSuccess?.call(context, state) ?? const SizedBox.shrink();
            } else if (state.screenStatus == ScreenStatus.empty) {
              return onEmpty?.call(context) ?? const SizedBox.shrink();
            } else if (state.screenStatus == ScreenStatus.error) {
              return onError?.call(context, state) ?? const SizedBox.shrink();
            } else {
              throw ArgumentError.value(state, 'state');
            }
          },
        );
}
