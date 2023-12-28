import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/widgets/shrink.dart';

import '../cubit/onboard.dart';

///
class OnBoardBottomCard extends StatelessWidget {
  const OnBoardBottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Stack(
            children: [
              const OnBoardMainImageList(),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.main.withOpacity(0.4),
                ),
              ),
              const BottonsAndIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardMainImageList extends StatelessWidget {
  const OnBoardMainImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardPageViewCubit, OnboardPageViewState>(
      builder: (context, state) {
        return PageView.builder(
          itemCount: state.onboards.length,
          controller: state.imageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return OnBoardMainImage(
              image: state.onboards[index].image!,
            );
          },
        );
      },
    );
  }
}

class OnBoardMainImage extends StatelessWidget {
  const OnBoardMainImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return OpacityTranslateAnimation(
      duration: const Duration(milliseconds: 1800),
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}

///
class OnBoardTextArea extends StatelessWidget {
  const OnBoardTextArea({super.key, required this.state});
  final OnboardPageViewState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          OnBoardTextList(state: state),
          const DotIndicatorBar(),
          AppSpace.h10,
        ],
      ),
    );
  }
}

class OnBoardTextList extends StatelessWidget {
  const OnBoardTextList({super.key, required this.state});
  final OnboardPageViewState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.onboards.length,
        controller: state.textController,
        itemBuilder: (context, index) {
          return OnBoardTextListCard(
            title: state.onboards[state.index].title,
            description: state.onboards[state.index].description,
          );
        },
      ),
    );
  }
}

class OnBoardTextListCard extends StatelessWidget {
  const OnBoardTextListCard(
      {super.key, required this.description, required this.title});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return OpacityTranslateAnimation(
      duration: const Duration(milliseconds: 2000),
      child: Padding(
        padding: AppPadding.h20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.defaultStyle.copyWith(
                color: AppColor.main,
                fontSize: 20.sp,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyle.defaultStyle.copyWith(
                fontSize: 14.sp,
                color: AppColor.fader,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
class BottonsAndIndicator extends StatelessWidget {
  const BottonsAndIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardPageViewCubit, OnboardPageViewState>(
      builder: (context, state) {
        final bool isNotLast = (state.onboards.length - 1 != state.index);
        return Align(
          alignment: const Alignment(0, 0.7),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.index > 0)
                Expanded(
                  child: OpacityTranslateAnimation(
                    duration: const Duration(milliseconds: 2000),
                    child: ShrinkButton(
                      child: CircleAvatar(
                        backgroundColor: AppColor.white,
                        radius: 25.sp,
                        child: const Icon(Icons.arrow_back),
                      ),
                      onPressed: () =>
                          _leftPressed(context, isFirst: state.index > 0),
                    ),
                  ),
                ),
              ShrinkButton(
                onPressed: () => _rightPressed(context, isNotLast: isNotLast),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  height: 40.h,
                  margin: EdgeInsets.only(right: 20.w),
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: AppColor.button,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.main.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 20,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      !isNotLast ? 'Start' : 'Next',
                      style: AppTextStyle.wHeader.copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _rightPressed(BuildContext context, {bool isNotLast = false}) async {
    if (isNotLast) {
      context.read<OnboardPageViewCubit>().clickNext();
    } else {
      context.read<OnboardPageViewCubit>().clickSkip();
    }
  }

  _leftPressed(BuildContext context, {bool isFirst = false}) async {
    if (isFirst) {
      context.read<OnboardPageViewCubit>().clickBack();
    } else {
      context.read<OnboardPageViewCubit>().clickSkip();
    }
  }
}

class DotIndicatorBar extends StatelessWidget {
  const DotIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardPageViewCubit, OnboardPageViewState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              state.onboards.length, (now) => _indicator(state.index != now)),
        );
      },
    );
  }

  Widget _indicator(bool isClick) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      width: isClick ? 7.w : 15.w,
      height: 7.w,
      decoration: BoxDecoration(
        // shape: isClick ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        color: isClick ? AppColor.main.withOpacity(0.4) : AppColor.fader,
      ),
    );
  }
}
