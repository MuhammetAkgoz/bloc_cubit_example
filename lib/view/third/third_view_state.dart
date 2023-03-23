import 'package:bloc_cubit_example/core/base/base_state.dart';

class ThirdState extends BaseState {
  ThirdState({
    required this.number,
  });

  final int number;

  @override
  List<Object?> get props => [number];

  ThirdState copyWith({
    int? number,
  }) {
    return ThirdState(
      number: number ?? this.number,
    );
  }
}
