import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/// Base class for states.
///
enum ScreenStatus { initial, loading, refreshing, empty, success, error }

class BaseState extends Equatable {
  const BaseState({required this.screenStatus});

  @mustCallSuper
  final ScreenStatus screenStatus;

  @override
  List<Object?> get props => [screenStatus];

  BaseState copyWith({
    ScreenStatus? screenStatus,
  }) {
    return BaseState(
      screenStatus: screenStatus ?? this.screenStatus,
    );
  }
}
