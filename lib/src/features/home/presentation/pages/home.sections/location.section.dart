import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/demo.dart';

class LocationsSection extends StatelessWidget {
  const LocationsSection({super.key, required this.locations});
  final List<LocationModel> locations;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _LocationTopBar(),
        AppSpace.h20,
        _LocationItemList(locations: locations)
      ],
    );
  }
}

class _LocationItemList extends StatelessWidget {
  const _LocationItemList({required this.locations});
  final List<LocationModel> locations;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 10.w),
        children: locations.map((e) => _LocationItemCard(item: e)).toList(),
      ),
    );
  }
}

class _LocationItemCard extends StatelessWidget {
  const _LocationItemCard({required this.item});
  final LocationModel item;
  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: () {
        //TODO
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        padding: EdgeInsets.all(5.w).copyWith(right: 20.w),
        decoration: BoxDecoration(
          color: AppColor.softGrey,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            HttpsImage(
              imageBuilder: (_, img) =>
                  CircleAvatar(backgroundImage: img, radius: 20.sp),
              placeholder: const CircleAvatar(),
              imageUrl: item.image,
            ),
            AppSpace.w10,
            Text(
              item.name,
              style: TextStyle(color: AppColor.text, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationTopBar extends StatelessWidget {
  const _LocationTopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Locations',
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
              'explore',
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
