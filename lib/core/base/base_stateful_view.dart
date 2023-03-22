import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseStatefulView] a base of all [StatefulWidget] classes.
/// [BaseStatefulView] has a standard life-cycle methods such as [initState],[dispose],[didUpdateWidget]
abstract class BaseStatefulView<W extends StatefulWidget, VM extends BaseViewModel> extends State<W> {
  /// [BaseStatefulView] is a constructor method.
  /// Method requires a [viewModel]
  BaseStatefulView({required this.viewModel});

  /// [viewModel] is required to use its method
  /// such as onInit, setBuildContext, onClose.
  @mustCallSuper
  final VM viewModel;

  @override
  void initState() {
    /// Called when this object is inserted into the tree
    super.initState();

    /// Transport currently widget context to BaseViewModel
    reader
      ..context = super.context
      ..onInit();
  }

  @override
  void dispose() {
    /// Called when this object is removed from the tree permanently.
    viewModel.onClose();
    super.dispose();
  }

  /// [reader] provides an instance that type of VM
  VM get reader => context.read<VM>();

  /// [watcher] is a func that tracks your state data, which is
  /// observations your parent widget via context
  /// [watcher] has a cost. When you call [watcher] with context of build method,
  /// [watcher] will rebuild three times your [build] widget.
  /// Should not be used unless necessary
  VM watcher(BuildContext context) => context.watch<VM>();
}
