import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/theme/cubit/cubit.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OpacityTranslateAnimation(
      child: SafeArea(
        child: Column(
          children: [
            _SettingsAppBar(),
            _SettingsPageContent(),
          ],
        ),
      ),
    );
  }
}

class _SettingsAppBar extends StatelessWidget {
  const _SettingsAppBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: AppPadding.h20,
        child: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              color: theme.text,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsPageContent extends StatelessWidget {
  const _SettingsPageContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.h20,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          const _SettingsTileWithSwitch(title: 'Theme'),
          _SettingsTile(
            title: 'My Address',
            image: AssetPath.address,
            onPressed: () {},
          ),
          _SettingsTile(
            title: 'Mail to us',
            image: AssetPath.mail,
            onPressed: () {},
          ),
          _SettingsTile(
            title: 'Talk to our Support',
            image: AssetPath.call,
            onPressed: () {},
          ),
          _SettingsTile(
            title: 'Log out',
            image: AssetPath.logout,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.image,
    required this.onPressed,
  });
  final String title;
  final String image;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: onPressed,
      child: Container(
        margin: AppPadding.v5,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              width: 40.w,
              colorFilter: ColorFilter.mode(
                theme.mainIcon,
                BlendMode.srcIn,
              ),
            ),
            AppSpace.w10,
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTileWithSwitch extends StatelessWidget {
  const _SettingsTileWithSwitch({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          margin: AppPadding.v5,
          padding: AppPadding.h10,
          child: Row(
            children: [
              SvgPicture.asset(
                AssetPath.sun,
                width: 25.w,
                colorFilter: ColorFilter.mode(
                  theme.mainIcon,
                  BlendMode.srcIn,
                ),
              ),
              AppSpace.w10,
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Switch.adaptive(
                value: state.isDark,
                applyCupertinoTheme: false,
                onChanged: (value) => context.read<ThemeCubit>().change(value),
              )
            ],
          ),
        );
      },
    );
  }
}
