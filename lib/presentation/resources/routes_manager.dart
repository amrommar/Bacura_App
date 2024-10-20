import 'package:bacura_app/presentation/homeScreen/More_tab/cards_management/cards_management_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/privacy_policy/privacy_policy_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/suggestions/suggestions_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/technical%20support/complaints_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/technical%20support/frequently_asked_questions_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/technical%20support/technical_support_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/technical%20support/userguide_screen.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/terms_and_conditions/terms_conditions_screen.dart';
import 'package:bacura_app/presentation/homeScreen/Offers_tab/offer_details_screen.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/request_details_screen.dart';
import 'package:bacura_app/presentation/homeScreen/customerService/customerService_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/payment_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/service_details_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/service_type_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/set_location_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/technicalquestions_screen.dart';
import 'package:bacura_app/presentation/homeScreen/notifications_screen/notifications_screen.dart';
import 'package:bacura_app/presentation/personal/lastoperations_screen.dart';
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
  static const String privacyPolicyRoute = '/privacyPolicy';
  static const String termsAndConditionsRoute = '/termsAndConditions';
  static const String suggestionsRoute = '/suggestions';
  static const String notificationsRoute = '/notifications';
  static const String customerServiceRoute = '/customerService';
  static const String paymentScreenRoute = '/paymentScreen';
  static const String technicalSupportRoute = '/technicalSupport';
  static const String complaintScreenRoute = '/complaintScreen';
  static const String frequentlyAskedQuestionsRoute =
      '/frequentlyAskedQuestions';
  static const String userGuideRoute = '/userGuide';
  static const String lastOperationsRoute = '/lastOperations';
  static const String testRoute = '/test';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingOneRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingOne_Screen());
      case Routes.onBoardingTwoRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingTwo_Screen());
      case Routes.onBoardingThreeRoute:
        return MaterialPageRoute(
            builder: (_) => const OnBoardingThree_Screen());
      case Routes.getStartedRoute:
        return MaterialPageRoute(builder: (_) => Getstarted_Screen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => Register_Screen());
      case Routes.verifyOTPRoute:
        return MaterialPageRoute(builder: (_) => VerifyOTP_Screen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => Login_Screen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => Home_Screen());
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
        return MaterialPageRoute(builder: (_) => TechnicalQuestions_Screen());
      case Routes.setLocationRoute:
        return MaterialPageRoute(builder: (_) => SetLocation_Screen());
      case Routes.serviceDetailsRoute:
        return MaterialPageRoute(builder: (_) => ServiceDetails_Screen());
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => PrivacyPolicy_Screen());
      case Routes.termsAndConditionsRoute:
        return MaterialPageRoute(builder: (_) => TermsConditions_Screen());
      case Routes.suggestionsRoute:
        return MaterialPageRoute(builder: (_) => Suggestions_Screen());

      case Routes.notificationsRoute:
        return MaterialPageRoute(builder: (_) => Notifications_Screen());
      case Routes.customerServiceRoute:
        return MaterialPageRoute(builder: (_) => Customerservice_Screen());
      case Routes.paymentScreenRoute:
        return MaterialPageRoute(builder: (_) => Payment_Screen());
      case Routes.technicalSupportRoute:
        return MaterialPageRoute(builder: (_) => TechnicalSupport_Screen());
      case Routes.complaintScreenRoute:
        return MaterialPageRoute(builder: (_) => Complaint_Screen());
      case Routes.frequentlyAskedQuestionsRoute:
        return MaterialPageRoute(
            builder: (_) => FrequentlyAskedQuestions_Screen());
      case Routes.userGuideRoute:
        return MaterialPageRoute(builder: (_) => UserGuide_Screen());
      case Routes.lastOperationsRoute:
        return MaterialPageRoute(builder: (_) => LastOperations_Screen());

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
