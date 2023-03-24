import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/product/theme/theme_provider.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondViewModel extends BaseViewModel<SecondState> {
  SecondViewModel() : super(const SecondState(args: '', color: Colors.yellow, title: 'Burak'));

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    this.logic();
  }

  void logic() async {
    load();

    await Future.delayed(const Duration(seconds: 5));
    ready();
  }

  void changeTheme() => BlocProvider.of<ThemeProvider>(context).change();
  void navigate() {
    emit(state.copyWith(color: Colors.red));
    navigator.navigateToPage(path: Routes.third);
  }
}
