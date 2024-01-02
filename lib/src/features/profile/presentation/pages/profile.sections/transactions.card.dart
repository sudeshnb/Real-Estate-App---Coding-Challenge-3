import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/utils/timeago.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/model.dart';
import 'package:proplink/src/features/home/presentation/cubit/favorite.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({super.key, required this.property});
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
            _TransactionsCardTop(property: property),
            AppSpace.h10,
            _TransactionsCardBottom(property: property)
          ],
        ),
      ),
    );
  }
}

class _TransactionsCardBottom extends StatelessWidget {
  const _TransactionsCardBottom({required this.property});

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
              SvgPicture.asset(AssetPath.time, width: 12.sp),
              AppSpace.w5,
              Expanded(
                child: Text(
                  Timeago.date(property.createAt!),
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
        ],
      ),
    );
  }
}

class _TransactionsCardTop extends StatelessWidget {
  const _TransactionsCardTop({required this.property});

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
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'Rent',
                  style: TextStyle(fontSize: 12.sp, color: AppColor.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
