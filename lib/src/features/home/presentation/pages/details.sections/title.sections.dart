import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LeftSideTitle(property: property),
          _RightSidePriceArea(property: property),
        ],
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
      textAlign: TextAlign.end,
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

class _LeftSideTitle extends StatelessWidget {
  const _LeftSideTitle({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: TextStyle(
            color: AppColor.main,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: property.area!),
            TextSpan(
              text: '\n${property.address}',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.main,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
