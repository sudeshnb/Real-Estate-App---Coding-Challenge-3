import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 56.w,
      padding: AppPadding.h10,
      margin: AppPadding.h20,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ItemTag(
            value: '${property.numBedroom} Bedroom',
            image: AssetPath.bedroom,
          ),
          _ItemTag(
            value: '${property.numBathroom} Bathroom',
            image: AssetPath.bathroom,
          ),
          _ItemTag(
            value: '${property.floorspace} sqft',
            image: AssetPath.sqft,
          ),
        ],
      ),
    );
  }
}

class _ItemTag extends StatelessWidget {
  const _ItemTag({required this.value, required this.image});

  final String value;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(theme.mainIcon, BlendMode.srcIn),
        ),
        AppSpace.h5,
        Text(value)
      ],
    );
  }
}
