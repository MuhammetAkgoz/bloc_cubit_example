import 'package:odin/base/base_state.dart';

class ThirdState extends BaseState {
  ThirdState({
    required this.number,
    super.screenStatus = ScreenStatus.initial,
  });

  final int number;

  @override
  List<Object?> get props => [number];

  @override
  ThirdState copyWith({
    int? number,
    ScreenStatus? screenStatus,
  }) {
    return ThirdState(
      number: number ?? this.number,
      screenStatus: screenStatus ?? super.screenStatus,
    );
  }
}
