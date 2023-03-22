import 'package:bloc_cubit_example/product/theme/color/IColorTheme.dart';
import 'package:bloc_cubit_example/product/theme/color/app_color.dart';
import 'package:flutter/material.dart';

class LightColor implements IColorTheme {

  LightColor() {
    primaryScaffoldBackground = colors.white;
    secondaryScaffoldBackground = colors.satinLinen;
    primaryColor = colors.lima;
    textColor = colors.outerSpace;
    buttonColor = colors.lima;
    inputBorder = colors.fiord;
    brightness = Brightness.light;
    cardColor = colors.white;
    contentBorderColor = colors.mystic;
    shadowColor = colors.lynch;
    selectedRowColor = colors.glacier;
    successColor = colors.lima;
    warningColor = colors.sunGlow;
    dividerColor = colors.lynch;
    infoColor = colors.azureRadiance;
    errorColor = colors.carnation;
    disableTextColor = colors.gullGray;
    disableButtonColor = colors.towerGray;
    appbarPrimary = colors.oliveDrab;
    appbarSecondary = colors.asparagus;
    appbarTertiary = colors.olivine;
    enableBorderColor = colors.gullGray;
    lightTextColor = colors.lynch;
    majorColor = colors.white;
    colorScheme = const ColorScheme.light().copyWith(onSurface: colors.lima, primary: colors.lima, secondary: colors.lima);
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
  Color? appbarTertiary;

  @override
  Color? appbarPrimary;

  @override
  Color? appbarSecondary;

  @override
  Color? dividerColor;

  @override
  Color? disableTextColor;

  @override
  Color? disableButtonColor;

  @override
  Color? enableBorderColor;

  @override
  Color? lightTextColor;

  @override
  Color? majorColor;

  @override
  final AppColors colors = AppColors();
}
