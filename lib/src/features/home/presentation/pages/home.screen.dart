import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import '../bloc/bloc.dart';
import '../widgets/custom.appbar.dart';
import '../widgets/error.dart';
import 'home.sections/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OpacityTranslateAnimation(
      child: Stack(
        children: [
          _backgroundCircle(),
          const _HomePageContent(),
        ],
      ),
    );
  }

  Positioned _backgroundCircle() {
    return Positioned(
      left: -55.w,
      top: -35.w,
      child: CircleAvatar(
        radius: 150.sp,
        backgroundColor: AppColor.main.withOpacity(0.2),
      ),
    );
  }
}

///
///
///

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight + 10.h,
      left: 0,
      right: 0,
      bottom: 0,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverPersistentHeader(
              delegate: AppBarSection(),
              pinned: true,
            ),
          ];
        },
        body: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            if (state is PropertyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PropertyFailure) {
              return AppFailureWidget(msg: state.msg);
            }
            if (state is PropertySuccess) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AppSpace.h10,
                    CategorySection(categories: state.data.categories),
                    DiscountSection(discounts: state.data.discounts),
                    FeaturedEstatesSection(features: state.data.features),
                    LocationsSection(locations: state.data.locations),
                    AgentsSection(agents: state.data.argents),
                    NearbySection(nearby: state.data.nearby),
                    AppSpace.h50,
                  ].verticalGap(20.w),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
