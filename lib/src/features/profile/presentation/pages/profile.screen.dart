import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/core/animation/animation.dart';
import 'package:proplink/src/features/profile/presentation/cubit/profile.list.dart';

import 'profile.sections/profile.sections.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileTabViewCubit()..execute(),
      child: const OpacityTranslateAnimation(
        child: SafeArea(
          child: Stack(
            children: [
              ProfilePageContent(),
              ProfileAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
