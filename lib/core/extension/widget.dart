import 'package:bloc_cubit_example/core/constants/dimen.dart';
import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget neoPadding([EdgeInsetsGeometry padding = EdgeInsets.zero]) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget neoPaddingAll([double value = DimenConstant.MEDIUM]) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget neoPaddingOnly({
    double top = DimenConstant.ZERO,
    double bottom = DimenConstant.ZERO,
    double left = DimenConstant.ZERO,
    double right = DimenConstant.ZERO,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: this,
    );
  }

  Widget neoPaddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget neoPaddingLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Widget neoVisibility([bool isVisible = false]) {
    return Visibility(
      visible: isVisible,
      child: this,
    );
  }
}
