import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/model.dart';
import 'package:proplink/src/features/home/presentation/cubit/favorite.dart';

class ListingsCard extends StatelessWidget {
  const ListingsCard({super.key, required this.property});
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
            _CardTop(property: property),
            AppSpace.h10,
            _CardBottom(property: property)
          ],
        ),
      ),
    );
  }
}

class _CardTop extends StatelessWidget {
  const _CardTop({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  color: theme.canvasColor,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(image: img, fit: BoxFit.cover),
                ),
              );
            },
          ),
          Positioned(
            top: 10.w,
            right: 10.w,
            left: 10.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  onPressed: () {
                    // TODO:
                  },
                  icon: Icons.edit,
                  radius: 15.sp,
                  color: AppColor.white,
                  bgColor: AppColor.button,
                ),
                BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    final bool hasData = state.properties.contains(property);
                    return CircleButton(
                      onPressed: () =>
                          context.read<FavoriteCubit>().add(property),
                      icon: hasData ? Icons.favorite : Icons.favorite_border,
                      radius: 15.sp,
                      color: hasData ? AppColor.white : AppColor.radial,
                      bgColor: hasData ? AppColor.button : AppColor.softGrey,
                    );
                  },
                ),
              ],
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
                borderRadius: BorderRadius.circular(10.0),
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

class _CardBottom extends StatelessWidget {
  const _CardBottom({required this.property});

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
