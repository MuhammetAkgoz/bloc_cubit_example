import 'dart:convert';
import 'dart:io';

import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/example/example_response.dart';
import 'package:bloc_cubit_example/example/example_state.dart';
import 'package:http/http.dart' as http;

class ExampleViewModel extends BaseViewModel<ExampleState> {
  ExampleViewModel() : super(ExampleState(number: 5, model: []));

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  void onInit() {
    get();
  }

  Future<void> get() async {
    emit(state.copyWith(serviceState: ServiceState.loading));
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
