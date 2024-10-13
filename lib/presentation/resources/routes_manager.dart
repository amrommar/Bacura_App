import 'package:bacura_app/presentation/homeScreen/More_tab/cards_management/cards_management_screen.dart';
import 'package:bacura_app/presentation/homeScreen/Offers_tab/offer_details_screen.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/request_details_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/questions_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/service_details_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/service_type_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/set_location_screen.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:bacura_app/presentation/test/test_screen.dart';
import 'package:flutter/material.dart';

import '../getStarted/getstarted_screen.dart';
import '../homeScreen/home_screen.dart';
import '../homeScreen/home_tab/service_request/set_date_screen.dart';
import '../login/login_screen.dart';
import '../onBoardingOne/onboardingone_screen.dart';
import '../onBoardingThree/onboardingthree_screen.dart';
import '../onBoardingTwo/onboardingtwo_screen.dart';
import '../personal/personal_details.dart';
import '../personal/wallet_details.dart';
import '../register/register_screen.dart';
import '../verifyOTP/verifyOTP_screen.dart';

class Routes {
  static const String onBoardingOneRoute = '/onBoardingOne';
  static const String onBoardingTwoRoute = '/onBoardingTwo';
  static const String onBoardingThreeRoute = '/onBoardingThree';
  static const String getStartedRoute = '/getStarted';
  static const String registerRoute = '/register';
  static const String verifyOTPRoute = '/verifyOTP';
  static const String loginRoute = '/login';
  static const String homeScreenRoute = '/homeScreen';
  static const String personalDetailsRoute = '/personalDetails';
  static const String walletDetailsRoute = '/walletDetails';
  static const String requestDetailsRoute = '/requestDetails';
  static const String cardsManagementRoute = '/cardsManagement';
  static const String offerDetailsRoute = '/offerDetails';
  static const String serviceTypeRoute = '/serviceType';
  static const String setDateRoute = '/setDate';
  static const String questionsRoute = '/questions';
  static const String setLocationRoute = '/setLocation';
  static const String serviceDetailsRoute = '/serviceDetails';
  static const String testRoute = '/test';
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
      case Routes.personalDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const PersonalDetails_Screen());
      case Routes.walletDetailsRoute:
        return MaterialPageRoute(builder: (_) => const Wallet_Details());
      case Routes.requestDetailsRoute:
        return MaterialPageRoute(builder: (_) => Request_Details_Screen());
      case Routes.cardsManagementRoute:
        return MaterialPageRoute(builder: (_) => Cards_Management_Screen());
      case Routes.offerDetailsRoute:
        return MaterialPageRoute(builder: (_) => OfferDetails_Screen());
      case Routes.serviceTypeRoute:
        return MaterialPageRoute(builder: (_) => ServiceType_Screen());
      case Routes.setDateRoute:
        return MaterialPageRoute(builder: (_) => SetDate_Screen());
      case Routes.questionsRoute:
        return MaterialPageRoute(builder: (_) => Questions_Screen());
      case Routes.setLocationRoute:
        return MaterialPageRoute(builder: (_) => SetLocation_Screen());
      case Routes.serviceDetailsRoute:
        return MaterialPageRoute(builder: (_) => ServiceDetails_Screen());

      /// text screen //////////////////////////
      case Routes.testRoute:
        return MaterialPageRoute(builder: (_) => test_screen());
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
