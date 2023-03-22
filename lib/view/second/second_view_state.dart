import 'package:bloc_cubit_example/core/base/base_state.dart';

class SecondState extends BaseState {
  SecondState({
    required this.args,
  });
  final String args;

  @override
  List<Object?> get props => [args];

  SecondState copyWith({
    String? args,
  }) {
    return SecondState(
      args: args ?? this.args,
    );
  }
}
