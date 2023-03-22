import 'dart:convert';
import 'dart:io';

import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/product/model/first_response.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/view/first/first_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstViewModel extends BaseViewModel<FirstState> {
  FirstViewModel() : super(FirstState(number: 5, model: []));

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  void onInit() {
    super.onInit();
    get();
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('updated');
  }

  Future<void> get() async {
    emit(state.copyWith(serviceState: ServiceState.loading));
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> body = jsonDecode(response.body);
      return emit(state.copyWith(
        model: body.map((dynamic item) => FirstResponseModel.fromJson(item)).toList(),
        serviceState: ServiceState.success,
      ));
    }
    throw Exception('fetch error');
  }

  void navigate() => navigator.navigateToPage(path: Routes.second, data: {'a': 'b'});
}
