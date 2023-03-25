import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:flutter/material.dart';

class SecondState extends BaseState {
  const SecondState({
    required this.args,
    required this.color,
    required this.title,
    super.screenStatus = ScreenStatus.loading,
  });
  final String args;
  final Color color;
  final String title;

  @override
  List<Object?> get props => [...super.props, args, color, title];

  SecondState copyWith({
    String? args,
    Color? color,
    String? title,
    ScreenStatus? screenStatus,
  }) {
    return SecondState(
      args: args ?? this.args,
      color: color ?? this.color,
      title: title ?? this.title,
      screenStatus: screenStatus ?? super.screenStatus,
    );
  }
}
