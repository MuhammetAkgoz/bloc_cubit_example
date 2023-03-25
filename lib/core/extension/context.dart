import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExtention on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primaryColor => theme.primaryColor;
  Color get splashColor => theme.indicatorColor;
}

extension TextExtention on BuildContext {
  TextTheme get textTheme => theme.textTheme;

  TextStyle? get bold26 => textTheme.headlineLarge?.copyWith(fontSize: 26);
  TextStyle? get bold20 => textTheme.headlineLarge;
  TextStyle? get bold16 => textTheme.headlineMedium;
  TextStyle? get bold14 => textTheme.headlineSmall;
  TextStyle? get bold12 => textTheme.headlineSmall?.copyWith(fontSize: 12);

  TextStyle? get regular20 => textTheme.bodyLarge;
  TextStyle? get regular16 => textTheme.bodyMedium;
  TextStyle? get regular14 => textTheme.bodySmall;
  TextStyle? get regular12 => textTheme.bodySmall?.copyWith(fontSize: 12);

  TextStyle? get medium20 => textTheme.titleLarge;
  TextStyle? get medium16 => textTheme.titleMedium;
  TextStyle? get medium14 => textTheme.titleSmall;
  TextStyle? get medium12 => textTheme.titleMedium?.copyWith(fontSize: 12);
  TextStyle? get medium10 => textTheme.titleMedium?.copyWith(fontSize: 10);

  TextStyle? get semiBold20 => textTheme.labelLarge;
  TextStyle? get semiBold18 => textTheme.labelLarge?.copyWith(fontSize: 18);
  TextStyle? get semiBold16 => textTheme.labelMedium;
  TextStyle? get semiBold14 => textTheme.labelSmall;
  TextStyle? get semiBold12 => textTheme.labelSmall?.copyWith(fontSize: 12);
  TextStyle? get semiBold10 => textTheme.labelSmall?.copyWith(fontSize: 10);
}

extension RandomExtension on BuildContext {
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  int get randomNumber => Random().nextInt(100);
}

extension MediaQueryValues on BuildContext {
  double get dynamicWidth => MediaQuery.of(this).size.width;
  double get dynamicHeight => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
}
