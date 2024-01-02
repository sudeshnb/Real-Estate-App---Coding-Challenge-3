import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/model.dart';
import 'package:proplink/src/features/profile/data/sources/sources.dart';
import 'package:proplink/src/features/profile/presentation/cubit/profile.list.dart';
import 'package:proplink/src/features/profile/presentation/pages/profile.sections/profile.sections.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<ProfileTabViewCubit>().state.index;
    final theme = Theme.of(context);
    return Container(
      height: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: theme.cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: profileList
            .map(
              (e) => ShrinkButton(
                onPressed: () =>
                    context.read<ProfileTabViewCubit>().click(e.id),
                child: AnimatedContainer(
                  height: 32.w,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  padding: AppPadding.h20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: index == e.id
                        ? theme.scaffoldBackgroundColor
                        : theme.cardColor,
                  ),
                  child: Center(
                    child: Text(
                      e.name,
                      style: TextStyle(
                        color: index == e.id ? theme.mainText : AppColor.hint,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProfileTabBarView extends StatelessWidget {
  const ProfileTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileTabViewCubit, ProfileTabViewState>(
      builder: (context, state) {
        return [
          if (state.transaction.isEmpty)
            const _EmptyList()
          else
            _TransactionList(list: state.transaction),
          if (state.listings.isEmpty)
            const _EmptyList()
          else
            _ListingsList(list: state.listings),
          if (state.sold.isEmpty)
            const _EmptyList()
          else
            _SoldList(list: state.sold),
        ][state.index];
      },
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.main.copyWith(bottom: 50.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetPath.empty, width: 80.w),
          AppSpace.h20,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your properties are\n",
                  style: TextStyle(
                    color: AppColor.main,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: "empty",
                  style: TextStyle(
                    color: AppColor.main,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          AppSpace.h10,
          Text(
            AppString.emptyList,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.main,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class _SoldList extends StatelessWidget {
  const _SoldList({required this.list});
  final List<Property> list;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 700),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 2500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.h20,
            Text(
              '${list.length} sold',
              style: TextStyle(
                color: theme.text,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            AppSpace.h20,
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.7,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.w,
              shrinkWrap: true,
              children: list.map((e) => SoldCard(property: e)).toList(),
            ),
            AppSpace.h50,
          ],
        ),
      ),
    );
  }
}

class _ListingsList extends StatelessWidget {
  const _ListingsList({required this.list});
  final List<Property> list;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 700),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 2500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${list.length} listings',
                  style: TextStyle(
                    color: theme.text,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CircleButton(
                  onPressed: () {
                    //TODO:
                  },
                  icon: Icons.add,
                  bgColor: AppColor.main,
                  color: AppColor.white,
                )
              ],
            ),
            AppSpace.h20,
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.7,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.w,
              shrinkWrap: true,
              children: list.map((e) => ListingsCard(property: e)).toList(),
            ),
            AppSpace.h50,
          ],
        ),
      ),
    );
  }
}

class _TransactionList extends StatelessWidget {
  const _TransactionList({required this.list});
  final List<Property> list;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 700),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 2500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.h20,
            Text(
              '${list.length} transactions',
              style: TextStyle(
                color: theme.text,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            AppSpace.h20,
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.7,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 20.w,
              shrinkWrap: true,
              children: list.map((e) => TransactionsCard(property: e)).toList(),
            ),
            AppSpace.h50,
          ],
        ),
      ),
    );
  }
}
