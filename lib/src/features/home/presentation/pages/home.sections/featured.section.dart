import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class FeaturedEstatesSection extends StatelessWidget {
  const FeaturedEstatesSection({super.key, required this.features});
  final List<Property> features;
  @override
  Widget build(BuildContext context) {
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 2500),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 5500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _FeaturedTopBar(),
            AppSpace.h20,
            _FeaturedItemList(features: features)
          ],
        ),
      ),
    );
  }
}

class _FeaturedItemList extends StatelessWidget {
  const _FeaturedItemList({required this.features});

  final List<Property> features;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: features.map((e) => _FeaturedItemCard(property: e)).toList(),
      ),
    );
  }
}

class _FeaturedItemCard extends StatelessWidget {
  const _FeaturedItemCard({required this.property});
  final Property property;
  void goToPage(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.details, arguments: property);
  }

  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: () => goToPage(context),
      child: Container(
        width: 260.w,
        margin: EdgeInsets.only(left: 20.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColor.softGrey,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            _FeaturedItemCardLeftSide(property: property),
            AppSpace.w10,
            _FeaturedItemCardRightSide(property: property)
          ],
        ),
      ),
    );
  }
}

class _FeaturedItemCardRightSide extends StatelessWidget {
  const _FeaturedItemCardRightSide({required this.property});

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
            style: const TextStyle(
              color: AppColor.text,
              // fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange),
              Text(
                property.reviewCount.toString(),
                style: const TextStyle(
                  color: AppColor.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(AssetPath.location, width: 12.sp),
              Text(
                property.city!,
                style: TextStyle(
                  color: AppColor.text,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColor.text,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: '${property.prices![0].currency} '),
                TextSpan(text: property.prices![0].amountMin.toString()),
                TextSpan(
                  text: '/${property.prices![0].isSale}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedItemCardLeftSide extends StatelessWidget {
  const _FeaturedItemCardLeftSide({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            top: 5.w,
            left: 5.w,
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
            left: 5.w,
            child: Container(
              height: 25.w,
              padding: AppPadding.h20,
              decoration: BoxDecoration(
                color: AppColor.main,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  property.propertyType!,
                  maxLines: 1,
                  style: TextStyle(color: AppColor.white, fontSize: 10.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FeaturedTopBar extends StatelessWidget {
  const _FeaturedTopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Featured Estates',
            style: TextStyle(
              color: AppColor.text,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          ShrinkButton(
            onPressed: () {
              //TODO
            },
            child: Text(
              'view all',
              style: TextStyle(
                color: AppColor.main,
                fontSize: 14.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
