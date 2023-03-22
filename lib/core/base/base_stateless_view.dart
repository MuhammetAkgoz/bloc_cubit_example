import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:flutter/material.dart';

/// [BaseStatelessView] a base of all [StatelessWidget] classes
abstract class BaseStatelessView<VM extends BaseViewModel> extends StatelessWidget {
  /// [BaseStatelessView] is a constructor method
  /// Method requires a [viewModel]
  const BaseStatelessView({required this.viewModel, super.key});

  /// [viewModel] is required to use its method
  @mustCallSuper
  final VM viewModel;
}
