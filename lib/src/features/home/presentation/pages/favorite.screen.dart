import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/home/presentation/cubit/favorite.dart';
import 'package:proplink/src/features/home/presentation/cubit/main.screen.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OpacityTranslateAnimation(
      child: SafeArea(
        child: Column(
          children: [
            _FavoriteAppBar(),
            _FavoritePageContent(),
          ],
        ),
      ),
    );
  }
}

class _FavoriteAppBar extends StatelessWidget {
  const _FavoriteAppBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: AppPadding.h20,
        child: AppBar(
          title: Text(
            'My favorite',
            maxLines: 1,
            style: TextStyle(
              color: theme.mainText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

///
///
///

class _FavoritePageContent extends StatelessWidget {
  const _FavoritePageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state.properties.isEmpty) {
          return const _FavoriteItemsEmpty();
        }
        return _FavoriteListView(properties: state.properties);
      },
    );
  }
}

class _FavoriteListView extends StatelessWidget {
  const _FavoriteListView({required this.properties});
  final List<Property> properties;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ScrollDetective(
        list: GridView.count(
          crossAxisCount: 2,
          padding: AppPadding.h20.copyWith(bottom: 50.w),
          childAspectRatio: 0.6,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 20.w,
          shrinkWrap: true,
          children:
              properties.map((e) => _FavoriteItemCard(property: e)).toList(),
        ),
        top: Container(
            decoration: AppDecoration.top(theme.scaffoldBackgroundColor),
            height: 20.w),
      ),
    );
  }
}

class _FavoriteItemCard extends StatelessWidget {
  const _FavoriteItemCard({required this.property});
  final Property property;
  void goToPage(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.details, arguments: property);
  }

  @override
  Widget build(BuildContext context) {
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 2500),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 4500),
        child: ShrinkButton(
          onPressed: () => goToPage(context),
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColor.softGrey,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              children: [
                _FavoriteItemCardTop(property: property),
                AppSpace.h10,
                _FavoriteItemCardBottom(property: property)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteItemCardBottom extends StatelessWidget {
  const _FavoriteItemCardBottom({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.area!,
            maxLines: 1,
            style: TextStyle(
              color: AppColor.darkText,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(AssetPath.star, width: 12.sp),
              AppSpace.w5,
              Text(
                property.reviewCount.toString(),
                style: const TextStyle(
                  color: AppColor.darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpace.w10,
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AssetPath.location, width: 12.sp),
                    AppSpace.w5,
                    Expanded(
                      child: Text(
                        property.city!,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.darkText,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FavoriteItemCardTop extends StatelessWidget {
  const _FavoriteItemCardTop({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          HttpsImage(
            placeholder: Container(
              decoration: BoxDecoration(
                color: AppColor.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            imageUrl: property.image!,
            imageBuilder: (context, img) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColor.softGrey,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(image: img, fit: BoxFit.cover),
                ),
              );
            },
          ),
          Positioned(
            top: 10.w,
            right: 10.w,
            child: CircleAvatar(
              backgroundColor: AppColor.button,
              radius: 15.sp,
              child: Icon(
                Icons.favorite,
                color: AppColor.white,
                size: 15.sp,
              ),
            ),
          ),
          Positioned(
            bottom: 5.w,
            right: 5.w,
            child: Container(
              height: 35.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColor.main,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: '${property.prices![0].currency} '),
                      TextSpan(text: property.prices![0].amountMin.toString()),
                      TextSpan(
                        text: '/${property.prices![0].isSale}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FavoriteItemsEmpty extends StatelessWidget {
  const _FavoriteItemsEmpty();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Padding(
        padding: AppPadding.main,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShrinkButton(
              onPressed: () => context.read<MainPageCubit>().click(0),
              child: SvgPicture.asset(AssetPath.add),
            ),
            AppSpace.h20,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your favorite page is\n",
                    style: TextStyle(
                      color: theme.mainText,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: "empty",
                    style: TextStyle(
                      color: theme.mainText,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            AppSpace.h10,
            Text(
              AppString.emptyFavorite,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.mainText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
