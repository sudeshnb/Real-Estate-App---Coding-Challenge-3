import 'package:flutter/material.dart';
import 'package:proplink/src/core/constants/constants.dart';

class StarRating extends StatelessWidget {
  final double rating;

  final double? size;

  const StarRating({super.key, this.size, this.rating = .0});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(Icons.star_border, color: AppColor.border, size: size);
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(Icons.star_half, color: AppColor.yellow, size: size);
    } else {
      icon = Icon(Icons.star, color: AppColor.yellow, size: size);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => buildStar(context, index),
      ),
    );
  }
}
