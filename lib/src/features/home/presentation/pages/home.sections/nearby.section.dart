import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/home/presentation/cubit/favorite.dart';

class NearbySection extends StatelessWidget {
  const NearbySection({super.key, required this.nearby});
  final List<Property> nearby;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _NearbyTopBar(),
        AppSpace.h20,
        _NearbyItemList(list: nearby)
      ],
    );
  }
}

class _NearbyItemList extends StatelessWidget {
  const _NearbyItemList({required this.list});

  final List<Property> list;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: AppPadding.h20,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.6,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 20.w,
      shrinkWrap: true,
      children: list.map((e) => _NearbyItemCard(property: e)).toList(),
    );
  }
}

class _NearbyItemCard extends StatelessWidget {
  const _NearbyItemCard({required this.property});
  final Property property;
  void goToPage(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.details, arguments: property);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: () => goToPage(context),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: [
            _NearbyItemCardTop(property: property),
            AppSpace.h10,
            _NearbyItemCardBottom(property: property)
          ],
        ),
      ),
    );
  }
}

class _NearbyItemCardBottom extends StatelessWidget {
  const _NearbyItemCardBottom({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.area!,
            maxLines: 1,
            style: TextStyle(
              color: theme.text,
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
                style: TextStyle(
                  color: theme.text,
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
                          color: theme.text,
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

class _NearbyItemCardTop extends StatelessWidget {
  const _NearbyItemCardTop({required this.property});

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
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final bool hasData = state.properties.contains(property);
                return CircleButton(
                  onPressed: () => context.read<FavoriteCubit>().add(property),
                  icon: hasData ? Icons.favorite : Icons.favorite_border,
                  radius: 15.sp,
                  color: hasData ? AppColor.white : AppColor.radial,
                  bgColor: hasData ? AppColor.button : AppColor.softGrey,
                );
              },
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

class _NearbyTopBar extends StatelessWidget {
  const _NearbyTopBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: AppPadding.h20,
      child: Text(
        'Explore Nearby Estates',
        style: TextStyle(
          color: theme.text,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
