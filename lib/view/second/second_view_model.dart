import 'dart:core';

import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/product/navigation/navigation_generator.dart';
import 'package:bloc_cubit_example/product/theme/theme_provider.dart';
import 'package:bloc_cubit_example/view/second/second_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondViewModel extends BaseViewModel<SecondState> {
  SecondViewModel() : super(const SecondState(args: '', color: Colors.yellow, title: 'Burak'));
  late final String appTitle;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    appTitle = args! as String;
    // emit(state.copyWith(screenStatus: ScreenStatus.loading));
    //print(args as Map<String, String>);
    // await Future.delayed(const Duration(seconds: 5));
    // emit(state.copyWith(screenStatus: ScreenStatus.success));
  }

  void changeTheme() => BlocProvider.of<ThemeProvider>(context).change();
  void navigate() => navigator.navigateToPage(path: Routes.third);
}
