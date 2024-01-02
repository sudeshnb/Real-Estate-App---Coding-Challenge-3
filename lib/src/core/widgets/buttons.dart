import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/theme/theme.dart';

import 'shrink.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.onPressed,
    this.bgColor,
    this.color,
    this.radius,
    this.iconSize,
    required this.icon,
  });
  final Color? bgColor;
  final IconData icon;
  final Function() onPressed;
  final Color? color;
  final double? radius;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: onPressed,
      child: CircleAvatar(
        radius: radius ?? 20.sp,
        backgroundColor: bgColor ?? theme.card,
        child: Icon(icon, color: color, size: radius),
      ),
    );
  }
}
