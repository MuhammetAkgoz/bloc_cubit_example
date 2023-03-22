import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/example/example_response.dart';

enum ServiceState { loading, success, error }

class ExampleState extends BaseState {
  final int number;
  final List<ExampleResponseModel> model;
  final ServiceState serviceState;
  final String name;

  ExampleState({
    required this.number,
    required this.model,
    this.serviceState = ServiceState.loading,
    this.name = '',
  });

  @override
  List<Object?> get props => [number, model, serviceState, name];

  ExampleState copyWith({
    int? number,
    List<ExampleResponseModel>? model,
    ServiceState? serviceState,
    String? name,
  }) {
    return ExampleState(
      number: number ?? this.number,
      model: model ?? this.model,
      serviceState: serviceState ?? this.serviceState,
      name: name ?? this.name,
    );
  }
}
