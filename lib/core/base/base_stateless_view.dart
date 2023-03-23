import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseStatelessView] a base of all [StatelessWidget] classes
abstract class BaseStatelessView<VM extends BaseViewModel> extends StatelessWidget {
  /// [BaseStatelessView] is a constructor method
  /// Method requires a [viewModel]
  const BaseStatelessView({required this.viewModel, super.key});

  /// [viewModel] is required to use its method
  @mustCallSuper
  final VM viewModel;

  /// [reader] provides an instance that type of VM
  VM reader(BuildContext context) => context.read<VM>();

  /// [watcher] is a func that tracks your state data, which is
  /// observations your parent widget via context
  /// [watcher] has a cost. When you call [watcher] with context of build method,
  /// [watcher] will rebuild three times your [build] widget.
  /// Should not be used unless necessary
  VM watcher(BuildContext context) => context.watch<VM>();
}
