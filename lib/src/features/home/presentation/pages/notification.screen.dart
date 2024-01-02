import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _NotificationsAppBar(),
            _NotificationsPageContent(),
          ],
        ),
      ),
    );
  }
}

class _NotificationsAppBar extends StatelessWidget {
  const _NotificationsAppBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: AppPadding.h20,
        child: AppBar(
          title: Text(
            'Notification',
            style: TextStyle(
              color: AppColor.darkText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationsPageContent extends StatelessWidget {
  const _NotificationsPageContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.h20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpace.h10,
          const _UserNameAndEmail(),
          AppSpace.h20,
          AppSpace.h20,
        ],
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: AppColor.darkText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          const TextSpan(text: 'Sudesh Bandara\n'),
          TextSpan(
            text: 'sudeshbandara@gmail.com',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
