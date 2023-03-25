import 'package:bloc_cubit_example/product/theme/color/app_color.dart';
import 'package:flutter/material.dart';

abstract class BaseColorTheme {
  AppColors get colors;

  /// Base Colors
  Color? primary;

  /// Appbar colors
  Color? appbarPrimary;
  Color? appbarSecondary;
  Color? appbarSurface;

  /// Text colors
  Color? textColor;
  Color? listTileTextColor;

  /// Indicators Colors
  Color? indicatorColor;

  /// Sheme Colors
  ColorScheme get scheme;
  Color? schemePrimary;
  Color? schemeSecondary;
}
