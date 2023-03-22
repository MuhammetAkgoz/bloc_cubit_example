import 'package:bloc_cubit_example/product/theme/color/app_color.dart';
import 'package:bloc_cubit_example/product/theme/color/base_color_theme.dart';
import 'package:flutter/material.dart';

class DarkColor implements BaseColorTheme {
  DarkColor() {
    colorScheme = const ColorScheme.light().copyWith(onPrimary: colors.lima, onSurface: colors.outerSpace);
    successColor = colors.sunGlow;
    warningColor = colors.lima;
    infoColor = colors.carnation;
    errorColor = colors.azureRadiance;
  }
  @override
  late final Brightness? brightness;

  @override
  late final ColorScheme? colorScheme;

  @override
  Color? primaryScaffoldBackground;

  @override
  Color? secondaryScaffoldBackground;

  @override
  Color? primaryColor;

  @override
  Color? textColor;

  @override
  Color? buttonColor;

  @override
  Color? inputBorder;

  @override
  Color? cardColor;

  @override
  Color? contentBorderColor;

  @override
  Color? shadowColor;

  @override
  Color? selectedRowColor;

  @override
  Color? errorColor;

  @override
  Color? infoColor;

  @override
  Color? successColor;

  @override
  Color? warningColor;

  @override
  Color? disableTextColor;

  @override
  Color? disableButtonColor;

  @override
  Color? dividerColor;

  @override
  Color? appbarPrimary;

  @override
  Color? appbarSecondary;

  @override
  Color? appbarTertiary;

  @override
  Color? enableBorderColor;

  @override
  Color? lightTextColor;

  @override
  Color? majorColor;

  @override
  final AppColors colors = AppColors();
}
