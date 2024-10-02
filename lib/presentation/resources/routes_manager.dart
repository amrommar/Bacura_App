import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../getStarted/getstarted_screen.dart';
import '../homeScreen/home_screen.dart';
import '../login/login_screen.dart';
import '../onBoardingOne/onboardingone_screen.dart';
import '../onBoardingThree/onboardingthree_screen.dart';
import '../onBoardingTwo/onboardingtwo_screen.dart';
import '../register/register_screen.dart';
import '../verifyOTP/verifyOTP_screen.dart';

class Routes {
  static const String onBoardingOneRoute = '/onBoardingOneRoute';
  static const String onBoardingTwoRoute = '/onBoardingTwoRoute';
  static const String onBoardingThreeRoute = '/onBoardingThreeRoute';
  static const String getStartedRoute = '/getStarted';
  static const String registerRoute = '/register';
  static const String verifyOTPRoute = '/verifyOTP';
  static const String loginRoute = '/login';
  static const String homeScreenRoute = '/homeScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingOneRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingOne_Screen());
      case Routes.onBoardingTwoRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingTwo_Screen());
      case Routes.onBoardingThreeRoute:
        return MaterialPageRoute(
            builder: (_) => const OnBoardingThree_Screen());
      case Routes.getStartedRoute:
        return MaterialPageRoute(builder: (_) => const Getstarted_Screen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const Register_Screen());
      case Routes.verifyOTPRoute:
        return MaterialPageRoute(builder: (_) => const VerifyOTP_Screen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Login_Screen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const Home_Screen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.no_Route_Founded)),
        body: const Center(child: Text(AppStrings.no_Route_Founded)),
      ),
    );
  }
}
