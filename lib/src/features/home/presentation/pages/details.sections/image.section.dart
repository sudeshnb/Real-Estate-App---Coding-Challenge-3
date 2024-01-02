import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h10,
      child: SizedBox(
        height: 450.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(
            children: [
              _MainImage(property: property),
              _RightSideImagesList(property: property),
              Positioned(
                bottom: 25.w,
                left: 20.w,
                child: Row(
                  children: [
                    _ReviewTag(reviewCount: property.reviewCount!),
                    AppSpace.w10,
                    _TypeTag(name: property.propertyType!)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeTag extends StatelessWidget {
  const _TypeTag({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.w,
      padding: AppPadding.h20,
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: AppColor.white, fontSize: 12.sp),
        ),
      ),
    );
  }
}

class _ReviewTag extends StatelessWidget {
  const _ReviewTag({required this.reviewCount});
  final double reviewCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.w,
      padding: AppPadding.h20,
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AssetPath.star, width: 20.sp),
          AppSpace.w5,
          Text(
            reviewCount.toString(),
            style: TextStyle(color: AppColor.white, fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}

class _RightSideImagesList extends StatelessWidget {
  const _RightSideImagesList({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25.w,
      right: 10.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PanaromaButton(image: property.panaroma!),
          ...List.generate(
            property.images!.length,
            (index) {
              if (property.images!.length > 3 && index == 2) {
                return _OverFlowMiniImage(
                  image: property.images![index],
                  index: property.images!.length - index,
                );
              }
              return _MiniImage(image: property.images![index]);
            },
          ).take(3)
        ].verticalGap(5.w),
      ),
    );
  }
}

class _PanaromaButton extends StatelessWidget {
  const _PanaromaButton({required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: () => goToPage(context),
      child: _MiniImageBox(
        child: Padding(
          padding: AppPadding.all10,
          child: SvgPicture.asset(
            AssetPath.panaroma,
            colorFilter: ColorFilter.mode(theme.mainIcon, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  void goToPage(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.panorama, arguments: image);
  }
}

class _MiniImage extends StatelessWidget {
  const _MiniImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return HttpsImage(
      imageBuilder: (_, img) {
        return _MiniImageBox(
          image: DecorationImage(image: img, fit: BoxFit.cover),
        );
      },
      placeholder: const _MiniImageBox(),
      imageUrl: image,
    );
  }
}

class _MiniImageBox extends StatelessWidget {
  const _MiniImageBox({this.image, this.child});
  final DecorationImage? image;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 55.w,
      width: 55.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: theme.cardColor,
        border: Border.all(width: 3, color: AppColor.white),
        image: image,
      ),
      child: child,
    );
  }
}

class _OverFlowMiniImage extends StatelessWidget {
  const _OverFlowMiniImage({required this.index, required this.image});

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return HttpsImage(
      imageBuilder: (_, img) {
        return SizedBox.square(
          dimension: 55.w,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(width: 3, color: AppColor.white),
                  image: DecorationImage(image: img, fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(width: 3, color: AppColor.white),
                  color: AppColor.black.withOpacity(0.4),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '+$index',
                  style: TextStyle(color: AppColor.white, fontSize: 20.sp),
                ),
              )
            ],
          ),
        );
      },
      placeholder: Container(color: AppColor.black),
      imageUrl: image,
    );
  }
}

class _MainImage extends StatelessWidget {
  const _MainImage({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return HttpsImage(
      imageBuilder: (_, img) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: Container(),
      imageUrl: property.image!,
    );
  }
}
