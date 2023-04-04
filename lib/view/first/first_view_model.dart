import 'dart:convert';
import 'dart:io';

import 'package:bloc_cubit_example/core/base/base_state.dart';
import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/product/model/first_response.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/view/first/first_view_state.dart';
import 'package:http/http.dart' as http;

class FirstViewModel extends BaseViewModel<FirstState> {
  FirstViewModel() : super(const FirstState(number: 5, model: []));

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    get();
  }

  Future<void> get() async {
    emit(state.copyWith(screenStatus: ScreenStatus.loading));
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body) as List<dynamic>;
      emit(state.copyWith(model: body.map(FirstResponseModel.fromJson).toList()));

      emit(state.copyWith(screenStatus: ScreenStatus.success));

      return;
    }
    throw Exception('fetch error');
  }

  void navigate() => navigator.navigateToPage(path: MenuKey.second.key, data: 'Muhammet');
}
