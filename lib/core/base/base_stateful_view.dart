import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseStatefulView] a base of all [StatefulWidget] classes.
/// [BaseStatefulView] has a standard life-cycle methods such as [initState],[dispose],[didUpdateWidget]
abstract class BaseStatefulView<W extends StatefulWidget, VM extends BaseViewModel> extends State<W> {
  @mustCallSuper
  final VM viewModel;

  BaseStatefulView({required this.viewModel});

  @override

  /// Called when this object is inserted into the tree
  void initState() {
    super.initState();
    reader.onInit();
  }

  @override

  /// Called when this object is removed from the tree permanently.
  void dispose() {
    super.dispose();
    reader.onClose();
  }

  @override

  /// Called whenever the widget configuration changes.
  void didUpdateWidget(W oldWidget) {
    super.didUpdateWidget(oldWidget);
    reader.didUpdateWidget(oldWidget);
  }

  /// [reader] provides an instance that type of VM
  VM get reader => context.read<VM>();

  /// [watcher] is a func that tracks your state data, which is
  /// observations your parent widget via context
  /// [watcher] has a cost. When you call [watcher] with context of build method,
  /// [watcher] will rebuild three times your [build] widget.
  /// Should not be used unless necessary
  VM watcher(context) => context.watch<VM>().state;
}
