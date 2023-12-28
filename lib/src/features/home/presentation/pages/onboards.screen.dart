import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/widgets/shrink.dart';
import 'package:proplink/src/features/home/presentation/cubit/onboard.dart';

import '../widgets/bottom.card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardPageViewCubit()..fetchData(),
      child: BlocConsumer<OnboardPageViewCubit, OnboardPageViewState>(
        listener: (context, state) {
          if (state.isLast) goToMainPage(context);
        },
        builder: (context, state) {
          final bool isNotLast = (state.onboards.length - 1 != state.index);
          return Scaffold(
            appBar: OnBoardingAppBar(isNotLast: isNotLast, state: state),
            body: Column(
              children: [
                OnBoardTextArea(state: state),
                const OnBoardBottomCard(),
              ],
            ),
          );
        },
      ),
    );
  }

  void goToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.home, (route) => false);
  }
}

class OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardingAppBar(
      {super.key, required this.isNotLast, required this.state});
  final bool isNotLast;
  final OnboardPageViewState state;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        if (isNotLast)
          Padding(
            padding: AppPadding.h20.copyWith(top: 10.h),
            child: ShrinkButton(
              child: Text(
                'Skip',
                style: AppTextStyle.wBody.copyWith(color: AppColor.main),
              ),
              onPressed: () => onPressed(context),
            ),
          )
      ],
    );
  }

  void onPressed(BuildContext context) async {
    if (!isNotLast) return;
    context.read<OnboardPageViewCubit>().clickSkip();
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
