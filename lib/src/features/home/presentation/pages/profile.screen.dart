import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          _ProfileAppBar(),
          _ProfilePageContent(),
        ],
      ),
    );
  }
}

class _ProfileAppBar extends StatelessWidget {
  const _ProfileAppBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: AppPadding.h20,
        child: AppBar(
          title: Text(
            'Profile',
            maxLines: 1,
            style: TextStyle(
              color: AppColor.text,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfilePageContent extends StatelessWidget {
  const _ProfilePageContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const DefaultTabController(
              length: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Transaction'),
                      Tab(text: 'Listings'),
                      Tab(text: 'Sold')
                    ],
                  ),
                  // TabBarView(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   children: [
                  //     const _SearchFoundListView(properties: []),
                  //     // Expanded(child: Container(color: AppColor.button)),
                  //     Expanded(child: Container(color: AppColor.button)),
                  //     Expanded(child: Container(color: AppColor.button)),
                  //   ],
                  // )
                ],
              ))
        ],
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
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: AppColor.text,
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
