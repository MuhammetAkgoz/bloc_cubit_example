import 'dart:core';

import 'package:bloc_cubit_example/core/base/base_view_model.dart';
import 'package:bloc_cubit_example/core/base/view/view_state_builder.dart';
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
  void onReady() async {
    super.onReady();
    BlocProvider.of<ViewStateBloc>(context).load();
    await Future<void>.delayed(const Duration(seconds: 3));
    BlocProvider.of<ViewStateBloc>(context).ready();
  }

  void changeTheme() => BlocProvider.of<ThemeProvider>(context).change();
  void navigate() => navigator.navigateToPage(path: MenuKey.third.key);
}
