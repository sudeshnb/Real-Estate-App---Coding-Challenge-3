import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class BrokerSection extends StatelessWidget {
  const BrokerSection({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.w,
      margin: AppPadding.h20,
      padding: AppPadding.h20,
      decoration: BoxDecoration(
        color: AppColor.softGrey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          _MiniImage(image: property.brokers![0].image!),
          _ContactInfo(property: property),
          SvgPicture.asset(AssetPath.message),
        ].horizontalGap(15.w),
      ),
    );
  }
}

class _MiniImage extends StatelessWidget {
  const _MiniImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return HttpsImage(
      imageBuilder: (_, img) {
        return CircleAvatar(radius: 25.sp, backgroundImage: img);
      },
      placeholder: CircleAvatar(radius: 25.sp),
      imageUrl: image,
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: TextStyle(
            color: AppColor.main,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: '${property.brokers![0].agent} '),
            TextSpan(
              text: '\n${property.brokers![0].phone}',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: '\n${property.brokers![0].email}',
              style: TextStyle(
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
