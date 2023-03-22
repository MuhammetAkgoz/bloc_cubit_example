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
        scaffoldBackgroundColor: theme.colorTheme.primaryScaffoldBackground,
        backgroundColor: theme.colorTheme.secondaryScaffoldBackground,
        primaryColor: theme.colorTheme.disableButtonColor,
        selectedRowColor: theme.colorTheme.selectedRowColor,
        errorColor: theme.colorTheme.errorColor,
        indicatorColor: theme.colorTheme.warningColor,
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        splashColor: Colors.transparent,
        unselectedWidgetColor: theme.colorTheme.infoColor,
        disabledColor: theme.colorTheme.disableTextColor,
        canvasColor: Colors.transparent,
        cardTheme: CardTheme(
            color: theme.colorTheme.cardColor,
            shadowColor: theme.colorTheme.shadowColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: theme.colorTheme.contentBorderColor ?? Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(8))),

        /// todo check
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              onPrimary: theme.colorTheme.primaryColor,
              primary: theme.colorTheme.buttonColor,
              onSurface: theme.colorTheme.disableButtonColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: theme.colorTheme.primaryColor ?? Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(8))),
        ),
        buttonTheme: const ButtonThemeData(
          alignedDropdown: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(18.0),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorTheme.inputBorder ?? Colors.grey, width: 2.0),
            ).copyWith(borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorTheme.primaryColor ?? Colors.green, width: 2.0),
            ).copyWith(borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ).copyWith(borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ).copyWith(borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorTheme.enableBorderColor ?? Colors.grey, width: 2.0),
            ).copyWith(borderRadius: const BorderRadius.all(Radius.circular(8.0)))),
        textTheme: TextTheme().apply(displayColor: theme.colorTheme.textColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: theme.colorTheme.secondaryScaffoldBackground,
        ),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(theme.colorTheme.primaryColor),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
        toggleButtonsTheme: ToggleButtonsThemeData(
          fillColor: theme.colorTheme.secondaryScaffoldBackground,
          color: theme.colorTheme.primaryColor,
          selectedColor: theme.colorTheme.primaryColor,
          borderColor: theme.colorTheme.primaryColor,
          selectedBorderColor: theme.colorTheme.primaryColor,
          disabledColor: theme.colorTheme.secondaryScaffoldBackground,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colorTheme.appbarPrimary,
          foregroundColor: theme.colorTheme.appbarSecondary,
          surfaceTintColor: theme.colorTheme.appbarTertiary,
        ),
        dividerColor: theme.colorTheme.dividerColor,
        colorScheme: theme.colorTheme.colorScheme,
        tabBarTheme: TabBarTheme(
          indicator: const BoxDecoration(),
          labelColor: theme.colorTheme.primaryColor,
          unselectedLabelColor: theme.colorTheme.primaryColor,
        ));
  }
}
