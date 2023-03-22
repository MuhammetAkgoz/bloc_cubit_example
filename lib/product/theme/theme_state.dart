import 'package:bloc_cubit_example/product/theme/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  ThemeState copyWith({
    ThemeMode? themeMode,
    IAppTheme? appTheme,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
