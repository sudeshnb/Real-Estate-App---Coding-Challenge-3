import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/theme/theme.dart';
import 'package:proplink/src/core/widgets/shrink.dart';
import 'package:proplink/src/features/home/data/models/nav.model.dart';
import 'package:proplink/src/features/home/data/sources/nav.source.dart';
import 'package:proplink/src/features/home/presentation/cubit/main.screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: const Scaffold(
        body: Stack(
          children: [
            MainPageBody(),
            MainPageBottomAppBar(),
          ],
        ),
      ),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return PageView.builder(
          itemCount: state.pages.length,
          controller: state.controller,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => state.pages[index],
        );
      },
    );
  }
}

class MainPageBottomAppBar extends StatelessWidget {
  const MainPageBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80.w,
        decoration: AppDecoration.bottomAppBar(
          theme.appBarTheme.backgroundColor!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navItems.map((e) => BottomAppBarButton(nav: e)).toList(),
        ),
      ),
    );
  }
}

class BottomAppBarButton extends StatelessWidget {
  const BottomAppBarButton({super.key, required this.nav});
  final NavModel nav;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        final bool isSelect = state.id == nav.id;
        return ShrinkButton(
          onPressed: () => context.read<MainPageCubit>().click(nav.id),
          child: SvgPicture.asset(
            isSelect ? nav.selected : nav.unselect,
            colorFilter: ColorFilter.mode(
              theme.mainIcon,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
