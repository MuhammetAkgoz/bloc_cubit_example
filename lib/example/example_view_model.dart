import 'dart:convert';
import 'dart:io';

import 'package:bloc_cubit_example/example/example_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ExampleViewModel extends Cubit<ExampleState> {
  ExampleViewModel() : super(const ExampleState(number: 5, model: []));

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> get() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> body = jsonDecode(response.body);

      return emit(state.copyWith(
        model: body.map((dynamic item) => ExampleResponseModel.fromJson(item)).toList(),
        serviceState: ServiceState.success,
      ));
    }
    throw Exception('fetch error');
  }
}

enum ServiceState { loading, success, error }

class ExampleState extends Equatable {
  final int number;
  final List<ExampleResponseModel> model;
  final ServiceState serviceState;

  const ExampleState({
    required this.number,
    required this.model,
    this.serviceState = ServiceState.loading,
  });

  @override
  List<Object?> get props => [number, model, serviceState];

  ExampleState copyWith({
    int? number,
    List<ExampleResponseModel>? model,
    ServiceState? serviceState,
  }) {
    return ExampleState(
      number: number ?? this.number,
      model: model ?? this.model,
      serviceState: serviceState ?? this.serviceState,
    );
  }
}
