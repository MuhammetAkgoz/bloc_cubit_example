import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/product/model/first_response.dart';

enum ServiceState { loading, success, error }

class FirstState extends BaseState {
  FirstState({
    required this.number,
    required this.model,
    this.serviceState = ServiceState.loading,
    this.name = 'Muhammet',
  });

  final int number;
  final List<FirstResponseModel> model;
  final ServiceState serviceState;
  final String name;

  @override
  List<Object?> get props => [number, model, serviceState, name];

  FirstState copyWith({
    int? number,
    List<FirstResponseModel>? model,
    ServiceState? serviceState,
    String? name,
  }) {
    return FirstState(
      number: number ?? this.number,
      model: model ?? this.model,
      serviceState: serviceState ?? this.serviceState,
      name: name ?? this.name,
    );
  }
}
