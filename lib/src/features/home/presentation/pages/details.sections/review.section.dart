import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/utils/timeago.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

import '../../widgets/rating.bar.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace.h10,
          Text(
            'Reviews',
            style: TextStyle(
              color: AppColor.main,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          _MainReviews(property: property),
          ...List.generate(property.reviews!.length, (index) {
            if (index > 0 && property.reviews!.length > 2) {
              return Column(
                children: [
                  _RivewCard(review: property.reviews![index]),
                  AppSpace.h20,
                  _viewAll()
                ],
              );
            }

            return _RivewCard(review: property.reviews![index]);
          }).take(2),
        ].verticalGap(12.w),
      ),
    );
  }

  Widget _viewAll() {
    return ShrinkButton(
      onPressed: () {},
      child: Container(
        height: 50.w,
        width: double.infinity,
        padding: AppPadding.all15,
        decoration: BoxDecoration(
          color: AppColor.softGrey,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            'View all reviews',
            style: TextStyle(
              color: AppColor.main,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _RivewCard extends StatelessWidget {
  const _RivewCard({required this.review});
  final Reviews review;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      width: double.infinity,
      padding: AppPadding.all15,
      decoration: BoxDecoration(
        color: AppColor.softGrey,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.w,
            width: 50.w,
            decoration: AppDecoration.circle(true),
            child: _profilePic(review.userImage!),
          ),
          AppSpace.w10,
          _ReviewCardTextArea(review: review),
        ],
      ),
    );
  }

  Widget _profilePic(String image) => HttpsImage(
        placeholder: const CircleAvatar(),
        imageUrl: image,
        imageBuilder: (context, img) => Padding(
          padding: const EdgeInsets.all(1.2),
          child: CircleAvatar(backgroundImage: img),
        ),
      );
}

class _ReviewCardTextArea extends StatelessWidget {
  const _ReviewCardTextArea({required this.review});

  final Reviews review;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.userName!,
                  style: TextStyle(
                    color: AppColor.main,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StarRating(rating: review.review!, size: 12.sp),
            ],
          ),
          Text(
            review.description!,
            maxLines: 4,
            style: TextStyle(
              color: AppColor.main,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            Timeago.time(review.createAt!),
            style: TextStyle(
              color: AppColor.radial,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _MainReviews extends StatelessWidget {
  const _MainReviews({required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.all10,
      decoration: BoxDecoration(
        color: AppColor.softGrey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              StarRating(rating: property.reviewCount!),
              Text(
                "From ${property.reviews!.length} reviewers",
                style: TextStyle(
                  color: AppColor.main,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          AppSpace.w10,
          Text(
            property.reviewCount.toString(),
            style: TextStyle(
              color: AppColor.main,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
