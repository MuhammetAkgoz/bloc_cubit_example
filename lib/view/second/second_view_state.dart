import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:flutter/material.dart';

class SecondState extends BaseState {
  final String args;
  final Color color;

  @override
  List<Object?> get props => [args, color];

  SecondState({
    required this.args,
    required this.color,
  });

  SecondState copyWith({
    String? args,
    Color? color,
  }) {
    return SecondState(
      args: args ?? this.args,
      color: color ?? this.color,
    );
  }
}
