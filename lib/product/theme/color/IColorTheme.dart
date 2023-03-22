import 'package:bloc_cubit_example/product/theme/color/app_color.dart';
import 'package:flutter/material.dart';

abstract class IColorTheme {
  AppColors get colors;
  Color? primaryScaffoldBackground;
  Color? secondaryScaffoldBackground;
  Color? primaryColor;
  Color? textColor;
  Color? lightTextColor;
  Color? buttonColor;
  Color? cardColor;
  Color? enableBorderColor;
  Color? dividerColor;

  /// can be use for card, container etc.
  Color? contentBorderColor;
  Color? shadowColor;
  Color? inputBorder;

  /// common colors
  Color? successColor;
  Color? warningColor;
  Color? errorColor;
  Color? infoColor;

  Color? selectedRowColor;
  Color? disableTextColor;
  Color? disableButtonColor;

  Color? majorColor;

  /// Appbar colors
  Color? appbarPrimary;
  Color? appbarSecondary;
  Color? appbarTertiary;

  Brightness? brightness;
  ColorScheme? colorScheme;
}
