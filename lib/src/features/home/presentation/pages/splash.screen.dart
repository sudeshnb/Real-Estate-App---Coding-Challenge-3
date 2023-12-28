import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proplink/src/core/config/package.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    execute();
    super.initState();
  }

  void execute() async {
    await Future.delayed(const Duration(seconds: 4), routeToOnboard);
  }

  dynamic routeToOnboard() {
    return Navigator.pushNamed(context, RoutesName.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          ContentsOfBody(),
        ],
      ),
    );
  }
}

///
///
///
class ContentsOfBody extends StatelessWidget {
  const ContentsOfBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Spacer(flex: 2),
          SvgPicture.asset(
            AssetPath.logo,
            semanticsLabel: 'App Logo',
            width: 250.w,
          ),
          AppSpace.h10,
          Text(AppString.appname, style: AppTextStyle.wHeader),
          Text(AppString.slogan, style: AppTextStyle.wSubheader),
          const Spacer(flex: 1),
          Text(AppString.dev, style: AppTextStyle.wBody),
          Text(
            "v${AppInfo.version}",
            style: AppTextStyle.wBody.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpace.h50,
        ],
      ),
    );
  }
}

///
///
///
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
          AssetPath.splash,
          height: height,
          fit: BoxFit.cover,
          semanticLabel: 'Background Image',
        ),
        Container(color: AppColor.fader.withOpacity(0.6)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height / 1.5,
            decoration: AppDecoration.fader,
          ),
        )
      ],
    );
  }
}
