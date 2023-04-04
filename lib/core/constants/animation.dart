import 'package:flutter/material.dart';

class AnimationConstant {
  static final inAnimation = Tween<Offset>(begin: const Offset(3.0, 0.0), end: const Offset(0.0, 0.0));
  static final outAnimation = Tween<Offset>(begin: const Offset(-3.0, 0.0), end: const Offset(0.0, 0.0));
}
