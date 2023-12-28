import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/extension/extension.dart';
import 'package:proplink/src/core/routes/routes.dart';
import 'package:proplink/src/core/widgets/widgets.dart';
import 'package:proplink/src/features/home/data/models/demo.dart';

class AgentsSection extends StatelessWidget {
  const AgentsSection({super.key, required this.agents});
  final List<AgentModel> agents;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _AgentsTopBar(),
        AppSpace.h20,
        _AgentsItemList(agents: agents)
      ],
    );
  }
}

class _AgentsItemList extends StatelessWidget {
  const _AgentsItemList({required this.agents});
  final List<AgentModel> agents;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.w),
        children: agents
            .map((e) => _AgentItemCard(item: e))
            .toList()
            .horizontalGap(20.w),
      ),
    );
  }
}

class _AgentItemCard extends StatelessWidget {
  const _AgentItemCard({required this.item});
  final AgentModel item;
  void goToMainPage(BuildContext context) {
    //TODO
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.home, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: () {
        //TODO
      },
      child: Column(
        children: [
          HttpsImage(
              placeholder: const CircleAvatar(),
              imageUrl: item.image,
              imageBuilder: (_, img) {
                return Container(
                  height: 50.w,
                  width: 50.w,
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: AppColor.softGrey,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: AppColor.softGrey),
                    image: DecorationImage(image: img, fit: BoxFit.cover),
                  ),
                );
              }),
          AppSpace.w10,
          Text(
            item.name,
            style: TextStyle(
              color: AppColor.text,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class _AgentsTopBar extends StatelessWidget {
  const _AgentsTopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Estate Agent',
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
