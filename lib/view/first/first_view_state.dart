import 'package:bloc_cubit_example/product/model/first_response.dart';
import 'package:odin/base/base_state.dart';

class FirstState extends BaseState {
  const FirstState({
    super.screenStatus = ScreenStatus.initial,
    required this.number,
    required this.model,
    this.name = 'Muhammet',
  });

  final int number;
  final List<FirstResponseModel> model;
  final String name;

  @override
  List<Object?> get props => [...super.props, number, model, name];

  FirstState copyWith({
    int? number,
    List<FirstResponseModel>? model,
    String? name,
    ScreenStatus? screenStatus,
  }) {
    return FirstState(
      number: number ?? this.number,
      model: model ?? this.model,
      name: name ?? this.name,
      screenStatus: screenStatus ?? super.screenStatus,
    );
  }
}
