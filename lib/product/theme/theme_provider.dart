import 'package:bloc_cubit_example/product/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeProvider extends Cubit<ThemeState> {
  ThemeProvider() : super(const ThemeState(themeMode: ThemeMode.system));

  void change() {
    if (state.themeMode == ThemeMode.light) {
      _setTheme(ThemeMode.dark);
      return;
    }
    _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    emit(ThemeState(themeMode: themeMode));
  }
}
