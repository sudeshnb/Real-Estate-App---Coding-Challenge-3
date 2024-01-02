import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/shrink.dart';
import 'package:proplink/src/features/home/data/models/demo.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return TranslateUpAnimation(
      duration: const Duration(milliseconds: 2000),
      child: OpacityTranslateAnimation(
        duration: const Duration(milliseconds: 3500),
        child: SizedBox(
          height: 50.w,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: AppPadding.h20,
            children: List.generate(categories.length, (index) {
              if (index == 0) {
                return _CategoryButton(
                    value: categories[index].name, isClick: true);
              }
              return _CategoryButton(value: categories[index].name);
            }).horizontalGap(15.w),
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({required this.value, this.isClick = false});
  final String value;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShrinkButton(
      onPressed: () {
        //TODO
      },
      child: Container(
        padding: AppPadding.all15,
        decoration: BoxDecoration(
          color: isClick ? AppColor.main : theme.cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          value,
          style: TextStyle(color: isClick ? AppColor.white : theme.text),
        ),
      ),
    );
  }
}
