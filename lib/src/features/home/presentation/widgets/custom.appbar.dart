import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/shrink.dart';

class AppBarSection extends SliverPersistentHeaderDelegate {
  AppBarSection();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const extraSpace = 170.0;
    double newSizePercent = extraSpace - shrinkOffset;
    final percent =
        (newSizePercent >= 0 ? newSizePercent : 0) / (extraSpace).abs();
    double width =
        max(((MediaQuery.sizeOf(context).width) - 40.w) * percent, 200);

    double positionY = 50 * (1 - percent);

    return SizedBox(
      height: 225.0,
      child: Stack(
        children: [
          _AppBarSection(percent: percent),
          _UserWelcomeSection(percent: percent, bottom: positionY),
          Positioned(
            bottom: min(positionY, 3),
            left: 0,
            child: _SearchSection(
              width: width,
              percent: percent * 10,
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 225.0;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(oldDelegate) => true;
}

///
///
///
///
class _SearchSection extends StatelessWidget {
  const _SearchSection({required this.percent, required this.width});
  final double width;
  final double percent;

  dynamic onPressed(BuildContext context) {
    return Navigator.pushNamed(context, RoutesName.search);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: () => onPressed(context),
      child: AnimatedContainer(
        margin: AppPadding.h20,
        duration: const Duration(milliseconds: 500),
        height: max(min(60.w * percent.round(), 60.w), 48.w),
        width: width,
        padding: AppPadding.all15,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetPath.search,
              colorFilter: ColorFilter.mode(theme.mainIcon, BlendMode.srcIn),
            ),
            const Expanded(
              child: Text(
                'Search House, Apartment, etc',
                style: TextStyle(color: AppColor.hint),
              ),
            ),
            Container(width: 1.2, color: AppColor.border),
            SvgPicture.asset(AssetPath.mic),
          ].horizontalGap(15.w),
        ),
      ),
    );
  }
}

///
///
///
class _AppBarSection extends StatelessWidget {
  const _AppBarSection({required this.percent});
  final double percent;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning 🌞';
      }
      if (hour < 17) {
        return 'Good Afternoon 🌤';
      }
      return 'Good Evening 🌖';
    }

    return ColoredBox(
      color: theme.appBarTheme.backgroundColor!,
      child: Stack(
        children: [
          _backgroundCircle(),
          Padding(
            padding: AppPadding.h20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _greetingMessage(greeting(), theme),
                AppSpace.w10,
                _circleButton(context, false),
                _circleButton(context, true),
              ].horizontalGap(10.w),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _backgroundCircle() {
    return Positioned(
      left: -73.w,
      top: -100.w,
      child: CircleAvatar(
        radius: 160.sp,
        backgroundColor: AppColor.main.withOpacity(0.2),
      ),
    );
  }

  Opacity _greetingMessage(String greeting, ThemeData theme) {
    return Opacity(
      opacity: percent,
      child: Container(
        height: 50.w,
        decoration: AppDecoration.greeting(theme.cardColor),
        padding: AppPadding.h20,
        child: Center(
          child: Text(
            greeting,
            style: TextStyle(
              color: theme.mainText,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleButton(BuildContext context, bool isProfile) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: () {
        if (!isProfile) {
          Navigator.of(context).pushNamed(RoutesName.notification);
        }
      },
      child: Container(
        height: 50.w,
        width: 50.w,
        decoration: AppDecoration.circle(isProfile, theme.cardColor),
        child: isProfile ? _profilePic(theme) : _notificationIcon(theme),
      ),
    );
  }

  Center _notificationIcon(ThemeData theme) => Center(
        child: SvgPicture.asset(
          AssetPath.notification,
          colorFilter: ColorFilter.mode(theme.mainIcon, BlendMode.srcIn),
        ),
      );

  Widget _profilePic(ThemeData theme) => CachedNetworkImage(
        placeholder: (context, url) => Shimmer(
          isLoading: true,
          child: CircleAvatar(backgroundColor: theme.cardColor),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageUrl: AssetPath.user,
        imageBuilder: (context, img) => Padding(
          padding: const EdgeInsets.all(1.2),
          child: CircleAvatar(
            backgroundImage: img,
            backgroundColor: theme.cardColor,
          ),
        ),
      );
}

///
class _UserWelcomeSection extends StatelessWidget {
  const _UserWelcomeSection({required this.percent, required this.bottom});
  final double percent;

  final double bottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      bottom: max(bottom, 90),
      left: 0,
      child: Padding(
        padding: AppPadding.h20,
        child: Opacity(
          opacity: min(percent, 1),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: theme.mainText,
                fontSize: 20.sp,
              ),
              children: [
                const TextSpan(text: 'Hey, '),
                TextSpan(
                  text: 'Sudesh!\n',
                  style: TextStyle(
                    color: theme.mainText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "Let's start exploring"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
