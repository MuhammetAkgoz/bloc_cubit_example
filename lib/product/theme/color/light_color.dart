import 'package:bloc_cubit_example/product/theme/color/app_color.dart';
import 'package:bloc_cubit_example/product/theme/color/base_color_theme.dart';
import 'package:flutter/material.dart';

class LightColor implements BaseColorTheme {
  LightColor() {
    /// Base Color
    primary = colors.sunsetOrange;

    /// Text Color
    textColor = colors.white;
    listTileTextColor = Colors.cyan;

    /// App Bar
    appbarPrimary = Colors.yellow;
    appbarSecondary = Colors.green;
    appbarSurface = Colors.red;

    /// Indicator
    indicatorColor = colors.sunsetOrange;

    /// Scheme
    schemePrimary = colors.sunsetOrange;
    schemeSecondary = colors.sunsetOrange;
  }

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
  ColorScheme get scheme => const ColorScheme.light().copyWith(primary: schemePrimary, secondary: schemeSecondary);
}
