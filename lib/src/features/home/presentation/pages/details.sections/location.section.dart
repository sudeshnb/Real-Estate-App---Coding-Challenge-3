import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/home/presentation/cubit/google.map.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => GoogleMapViewCubit()..load(property),
      child: Padding(
        padding: AppPadding.h20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location & Public Facilities',
              style: TextStyle(
                color: theme.mainText,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: theme.cardColor,
                  child: SvgPicture.asset(
                    AssetPath.location,
                    height: 20.sp,
                    colorFilter:
                        ColorFilter.mode(theme.mainIcon, BlendMode.srcIn),
                  ),
                ),
                AppSpace.w10,
                Text(
                  property.address!,
                  style: TextStyle(
                    color: theme.mainText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              height: 256.w,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: BlocBuilder<GoogleMapViewCubit, GoogleMapViewState>(
                      builder: (context, state) {
                        return GoogleMap(
                          initialCameraPosition: state.center,
                          markers: state.markers,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ShrinkButton(
                      onPressed: () {
                        //TODO
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    LocationFullView(property: property)));
                      },
                      child: Center(
                        child: Text(
                          'View all on map',
                          style: TextStyle(
                            color: theme.mainText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].verticalGap(12.w),
        ),
      ),
    );
  }
}

class LocationFullView extends StatelessWidget {
  const LocationFullView({super.key, required this.property});
  final Property property;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapViewCubit()..load(property),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<GoogleMapViewCubit, GoogleMapViewState>(
              builder: (context, state) {
                return GoogleMap(
                  initialCameraPosition: state.center,
                  markers: state.markers,
                  myLocationButtonEnabled: false,
                  trafficEnabled: true,
                );
              },
            ),
            Positioned(
              top: kToolbarHeight,
              left: 20.w,
              child: CircleButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icons.arrow_back_ios_new_outlined,
                bgColor: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
