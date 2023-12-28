import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/demo.dart';

class DiscountSection extends StatelessWidget {
  const DiscountSection({super.key, required this.discounts});
  final List<DiscountModel> discounts;
  @override
  Widget build(BuildContext context) {
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 2000),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 4500),
        child: SizedBox(
          height: 150.w,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                discounts.map((e) => DiscountCategoryTile(data: e)).toList(),
          ),
        ),
      ),
    );
  }
}

class DiscountCategoryTile extends StatelessWidget {
  const DiscountCategoryTile({super.key, required this.data});
  final DiscountModel data;

  void goToPage(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.details, arguments: data.property);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: HttpsImage(
          placeholder: Container(
            decoration: BoxDecoration(
              color: AppColor.black,
              borderRadius: AppDecoration.discountRadius,
            ),
          ),
          imageUrl: data.image,
          imageBuilder: (context, img) {
            return ShrinkButton(
              onPressed: () => goToPage(context),
              child: ClipRRect(
                borderRadius: AppDecoration.discountRadius,
                child: Stack(
                  children: [
                    Container(
                      width: 250.w,
                      foregroundDecoration: BoxDecoration(
                        color: AppColor.black.withOpacity(0.4),
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.main,
                        image: DecorationImage(image: img, fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 50.w,
                        width: 80.w,
                        padding: AppPadding.all15,
                        decoration: const BoxDecoration(
                          color: AppColor.main,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: SvgPicture.asset(AssetPath.arrow),
                      ),
                    ),
                    Padding(
                      padding: AppPadding.all15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data.offer,
                            style: const TextStyle(color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
