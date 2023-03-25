import 'package:bloc_cubit_example/product/theme/color/app_color.dart';
import 'package:bloc_cubit_example/product/theme/color/base_color_theme.dart';
import 'package:flutter/material.dart';

class DarkColor implements BaseColorTheme {
  DarkColor() {}

  @override
  final AppColors colors = AppColors();

  @override
  Color? appbarPrimary;

  @override
  Color? appbarSecondary;

  @override
  Color? appbarSurface;

  @override
  Color? indicatorColor;

  @override
  Color? textColor;

  @override
  Color? listTileTextColor;

  @override
  Color? primary;

  @override
  Color? schemePrimary;

  @override
  Color? schemeSecondary;

  @override
  ColorScheme get scheme => ColorScheme.dark();
}
