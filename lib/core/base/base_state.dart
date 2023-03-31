import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/// [ScreenStatus] holds state of ViewStateBuilder
enum ScreenStatus {
  initial,
  loading,
  refreshing,
  empty,
  success,
  error,
}

/// Base class for states.
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
