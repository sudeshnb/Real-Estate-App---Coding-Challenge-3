import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/home/presentation/widgets/error.dart';

import '../bloc/bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search results'),
        ),
        body: Column(
          children: [
            const _SearchTextField(),
            AppSpace.h20,
            const _FoundCountAndListType(),
            AppSpace.h20,
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchFound) {
                    return _SearchFoundListView(state: state);
                  }
                  if (state is SearchError) {
                    return AppFailureWidget(msg: state.msg);
                  }
                  if (state is SearchLoading) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  if (state is SearchNotFound) {
                    return const _SearchNotFoundWidget();
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoundCountAndListType extends StatelessWidget {
  const _FoundCountAndListType();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchFound) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: AppPadding.h20,
              child: Text(
                "Found ${state.properties.length} estates",
                style: TextStyle(
                  color: AppColor.main,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _SearchNotFoundWidget extends StatelessWidget {
  const _SearchNotFoundWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.5),
      child: Padding(
        padding: AppPadding.main,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetPath.empty),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Search ",
                  style: TextStyle(
                    color: AppColor.main,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "not found ",
                  style: TextStyle(
                    color: AppColor.main,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              AppString.notFound,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.main,
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

class _SearchFoundListView extends StatelessWidget {
  const _SearchFoundListView({required this.state});
  final SearchFound state;
  @override
  Widget build(BuildContext context) {
    return ScrollDetective(
      list: GridView.count(
        crossAxisCount: 2,
        padding: AppPadding.h20.copyWith(bottom: 50.w),
        childAspectRatio: 0.6,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.w,
        shrinkWrap: true,
        children:
            state.properties.map((e) => _NearbyItemCard(property: e)).toList(),
      ),
      top: Container(decoration: AppDecoration.top, height: 20.w),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.h20,
      height: 56.w,
      padding: AppPadding.all15,
      decoration: BoxDecoration(
        color: AppColor.softGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetPath.search),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) =>
                  context.read<SearchBloc>().add(Search(text: value)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search House, Apartment, etc',
                hintStyle: TextStyle(color: AppColor.hint, fontSize: 12.sp),
              ),
            ),
          ),
        ].horizontalGap(15.w),
      ),
    );
  }
}

class _NearbyItemCard extends StatelessWidget {
  const _NearbyItemCard({required this.property});
  final Property property;
  void goToPage(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.details, arguments: property);
  }

  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: () => goToPage(context),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColor.softGrey,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: [
            _NearbyItemCardTop(property: property),
            AppSpace.h10,
            _NearbyItemCardBottom(property: property)
          ],
        ),
      ),
    );
  }
}

class _NearbyItemCardBottom extends StatelessWidget {
  const _NearbyItemCardBottom({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.area!,
            maxLines: 1,
            style: TextStyle(
              color: AppColor.text,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(AssetPath.star, width: 12.sp),
              AppSpace.w5,
              Text(
                property.reviewCount.toString(),
                style: const TextStyle(
                  color: AppColor.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpace.w10,
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AssetPath.location, width: 12.sp),
                    AppSpace.w5,
                    Expanded(
                      child: Text(
                        property.city!,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.text,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NearbyItemCardTop extends StatelessWidget {
  const _NearbyItemCardTop({required this.property});

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
            child: CircleAvatar(
              backgroundColor: AppColor.button,
              radius: 15.sp,
              child: Icon(
                Icons.favorite,
                color: AppColor.white,
                size: 15.sp,
              ),
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
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: '${property.prices![0].currency} '),
                      TextSpan(text: property.prices![0].amountMin.toString()),
                      TextSpan(
                        text: '/${property.prices![0].isSale}',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
