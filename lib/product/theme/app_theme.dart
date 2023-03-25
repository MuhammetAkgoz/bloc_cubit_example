import 'package:bloc_cubit_example/product/theme/color/base_color_theme.dart';
import 'package:bloc_cubit_example/product/theme/color/dark_color.dart';
import 'package:bloc_cubit_example/product/theme/color/light_color.dart';
import 'package:flutter/material.dart';

abstract class IAppTheme {
  BaseColorTheme get colorTheme;
}

class LightAppTheme extends IAppTheme {
  @override
  BaseColorTheme get colorTheme => LightColor();
}

class DarkAppTheme extends IAppTheme {
  @override
  BaseColorTheme get colorTheme => DarkColor();
}

abstract class AppThemeBuilder {
  static ThemeData createTheme(IAppTheme theme) {
    return ThemeData(
      primaryColor: theme.colorTheme.primary,
      colorScheme: theme.colorTheme.scheme,
      indicatorColor: theme.colorTheme.indicatorColor,
      listTileTheme: ListTileThemeData(textColor: theme.colorTheme.listTileTextColor),
      textTheme: TextTheme().apply(displayColor: Colors.green),
      appBarTheme: AppBarTheme(
        backgroundColor: theme.colorTheme.appbarPrimary,
        foregroundColor: theme.colorTheme.appbarSecondary,
        surfaceTintColor: theme.colorTheme.appbarSurface,
      ),
    );
  }
}
