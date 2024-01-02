import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isActive ? AppColor.main : AppColor.transparent,
      radius: 10.sp,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: Tween<double>(begin: 0.85, end: 1).animate(anim),
          child: FadeTransition(opacity: anim, child: child),
        ),
        child: isActive
            ? Center(
                child: Icon(
                  Icons.check,
                  key: const ValueKey('icon1'),
                  size: 15.sp,
                  color: AppColor.white,
                ),
              )
            : const SizedBox(key: ValueKey('icon2')),
      ),
    );
  }
}
