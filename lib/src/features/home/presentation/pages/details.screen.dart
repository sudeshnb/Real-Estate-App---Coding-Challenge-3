import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

import '../cubit/favorite.dart';
import 'details.sections/sections.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ScrollDetective(
              list: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ImageSection(property: property),
                  TitleSection(property: property),
                  Padding(
                    padding: AppPadding.h20,
                    child:
                        const Divider(thickness: 3, color: AppColor.softGrey),
                  ),
                  FacilitiesSection(property: property),
                  Padding(
                    padding: AppPadding.h20,
                    child: Text(
                      property.overView!,
                      style: const TextStyle(color: AppColor.text),
                    ),
                  ),
                  BrokerSection(property: property),
                  LocationSection(property: property),
                  ReviewSection(property: property),
                  SizedBox(height: 150.h),
                ].verticalGap(12.w),
              ),
              top: Container(decoration: AppDecoration.top, height: 20.w),
            ),
            _AppBar(property: property),
            _BottomNavBar(property: property)
          ],
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100.w,
        decoration: AppDecoration.bottomAppBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _RightSidePriceArea(property: property),
            ShrinkButton(
              onPressed: () {},
              child: Container(
                height: 56.w,
                decoration: BoxDecoration(
                  color: AppColor.button,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: AppPadding.h20,
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Booking Now',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(AssetPath.arrow),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RightSidePriceArea extends StatelessWidget {
  const _RightSidePriceArea({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          color: AppColor.main,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(text: '${property.prices![0].currency} '),
          TextSpan(text: property.prices![0].amountMin.toString()),
          TextSpan(
            text: '\npre ${property.prices![0].isSale}',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColor.main,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: kToolbarHeight,
      top: 20.w,
      left: 20.w,
      right: 20.w,
      child: Row(
        children: [
          CircleButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icons.arrow_back_ios_new_rounded,
          ),
          const Spacer(),
          CircleButton(
            onPressed: () {},
            icon: Icons.ios_share_rounded,
          ),
          AppSpace.w10,
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              final bool hasData = state.properties.contains(property);
              return CircleButton(
                onPressed: () => context.read<FavoriteCubit>().add(property),
                icon: hasData ? Icons.favorite : Icons.favorite_border,
                color: hasData ? AppColor.white : AppColor.radial,
                bgColor: hasData ? AppColor.button : AppColor.softGrey,
              );
            },
          ),
        ],
      ),
    );
  }
}
