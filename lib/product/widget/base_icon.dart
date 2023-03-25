import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon({super.key, this.onPress, required this.iconName, this.width, this.height});
  final VoidCallback? onPress;
  final String iconName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(iconName),
      ),
    );
  }
}
