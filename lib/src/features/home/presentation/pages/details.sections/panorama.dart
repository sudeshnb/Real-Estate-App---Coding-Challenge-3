import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/presentation/widgets/pano/panorama.dart';

class ImageViewPanorama extends StatelessWidget {
  const ImageViewPanorama({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Panorama(
            child: Image.network(image, fit: BoxFit.contain),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 20.w,
            child: CircleButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icons.arrow_back_ios_new_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
