library route_pages;

import 'package:flutter/material.dart';
import 'package:proplink/src/core/error/exception.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/home/presentation/pages/details.screen.dart';
import 'package:proplink/src/features/home/presentation/pages/details.sections/panorama.dart';
import 'package:proplink/src/features/home/presentation/pages/main.screen.dart';
import 'package:proplink/src/features/home/presentation/pages/onboards.screen.dart';
import 'package:proplink/src/features/home/presentation/pages/splash.screen.dart';
import 'package:proplink/src/features/search/presentation/pages/pages.dart';
import '/src/core/animation/animation.dart';
import 'routes.dart';

class AppRoute {
  static const initial = RoutesName.initial;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
        return const PageFadeTransition(child: SplashScreen()).build;

      case RoutesName.onboarding:
        return const PageFadeTransition(child: OnboardingScreen()).build;

      case RoutesName.home:
        return const PageFadeTransition(child: MainPage()).build;

      case RoutesName.details:
        Property data = settings!.arguments as Property;
        return PageFadeTransition(child: DetailsScreen(property: data)).build;

      case RoutesName.panorama:
        String data = settings!.arguments as String;
        return PageFadeTransition(child: ImageViewPanorama(image: data)).build;

      case RoutesName.search:
        return const PageFadeTransition(child: SearchPage()).build;

      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
