import 'package:flutter_bloc/flutter_bloc.dart';

import 'scroll.cubit.dart';
import 'package:flutter/material.dart';

class ScrollDetective extends StatelessWidget {
  const ScrollDetective({
    super.key,
    this.bottom,
    required this.list,
    this.top,
    this.left,
  });
  final Widget list;
  final Widget? top;
  final Widget? left;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrollDetectCubit(),
      child: BlocBuilder<ScrollDetectCubit, ScrollDetectState>(
        builder: (context, state) {
          return Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (noti) {
                  context
                      .read<ScrollDetectCubit>()
                      .challenge(noti.metrics.extentBefore != 0.0);
                  return true;
                },
                //Remove the Overlay of scroll Indicator
                child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification) {
                      notification.disallowIndicator();
                      return false;
                    },
                    child: list),
              ),
              //
              if (state.isScroll && top != null)
                Align(
                  alignment: Alignment.topCenter,
                  child: top,
                ),
              if (state.isScroll && left != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: left,
                ),
              if (state.isScroll && bottom != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: bottom,
                ),
            ],
          );
        },
      ),
    );
  }
}
