import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:flutter/material.dart';

class SecondState extends BaseState {
  const SecondState({
    required this.args,
    required this.color,
    super.screenStatus = ScreenStatus.initial,
  });
  final String args;
  final Color color;

  @override
  List<Object?> get props => [...super.props, args, color];

  SecondState copyWith({
    String? args,
    Color? color,
    ScreenStatus? screenStatus,
  }) {
    return SecondState(
      args: args ?? this.args,
      color: color ?? this.color,
      screenStatus: screenStatus ?? super.screenStatus,
    );
  }
}
