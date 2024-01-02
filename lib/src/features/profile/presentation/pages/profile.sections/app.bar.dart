import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: AppPadding.h20,
        child: AppBar(
          title: Text(
            'Profile',
            maxLines: 1,
            style: TextStyle(
              color: theme.mainText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            CircleButton(
              onPressed: () {},
              icon: Icons.settings_outlined,
              color: theme.mainIcon,
            )
          ],
        ),
      ),
    );
  }
}
