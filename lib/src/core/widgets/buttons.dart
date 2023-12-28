import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';

import 'shrink.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.onPressed,
    this.bgColor = AppColor.softGrey,
    this.color,
    this.radius,
    this.iconSize,
    required this.icon,
  });
  final Color bgColor;
  final IconData icon;
  final Function() onPressed;
  final Color? color;
  final double? radius;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: onPressed,
      child: CircleAvatar(
        radius: radius ?? 20.sp,
        backgroundColor: bgColor,
        child: Icon(icon, color: color, size: radius),
      ),
    );
  }
}
