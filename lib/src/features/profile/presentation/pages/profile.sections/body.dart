import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'tabs.dart';

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: ScrollDetective(
        list: SingleChildScrollView(
          padding: AppPadding.h20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _ProfilePic(),
              AppSpace.h10,
              const _UserNameAndEmail(),
              AppSpace.h20,
              const _CountDisplay(),
              AppSpace.h20,
              const ProfileTabBar(),
              const ProfileTabBarView(),
            ],
          ),
        ),
        top: Container(
            decoration: AppDecoration.top(theme.scaffoldBackgroundColor),
            height: 20.w),
      ),
    );
  }
}

class _ProfilePic extends StatelessWidget {
  const _ProfilePic();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _profilePic(),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleButton(
            onPressed: () {},
            icon: Icons.edit,
            bgColor: AppColor.fader,
            radius: 15.sp,
            color: AppColor.white,
          ),
        )
      ],
    );
  }

  Widget _profilePic() => HttpsImage(
        placeholder: CircleAvatar(radius: 60.sp),
        imageUrl: AssetPath.user,
        imageBuilder: (context, img) =>
            CircleAvatar(backgroundImage: img, radius: 60.sp),
      );
}

class _CountDisplay extends StatelessWidget {
  const _CountDisplay();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _countTile('Listings', '30'),
        AppSpace.w10,
        _countTile('Sold', '10'),
        AppSpace.w10,
        _countTile('Reviews', '23'),
      ],
    );
  }

  Widget _countTile(String title, String value) {
    return Expanded(
      child: Container(
        padding: AppPadding.all15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: AppColor.border),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: theme.mainText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          const TextSpan(text: 'Sudesh Bandara\n'),
          TextSpan(
            text: 'sudeshbandara@gmail.com',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
