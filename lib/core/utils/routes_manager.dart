import 'package:bacura_app/core/utils/index.dart';

class Routes {
  static const String onBoardingOneRoute = '/onBoardingOne';
  static const String onBoardingTwoRoute = '/onBoardingTwo';
  static const String onBoardingThreeRoute = '/onBoardingThree';
  static const String getStartedRoute = '/getStarted';
  static const String completeProfileRoute = '/register';
  static const String verifyOTPRoute = '/verifyOTP';
  static const String loginRoute = '/login';
  static const String homeRoute = '/homeScreen';
  static const String personalDetailsRoute = '/personalDetails';
  static const String walletDetailsRoute = '/walletDetails';
  static const String requestDetailsRoute = '/requestDetails';
  static const String cardsManagementRoute = '/cardsManagement';
  static const String offerDetailsRoute = '/offerDetails';
  static const String serviceTypeRoute = '/serviceType';
  static const String serviceDetailsRoute = '/serviceDetails';
  static const String privacyPolicyRoute = '/privacyPolicy';
  static const String termsAndConditionsRoute = '/termsAndConditions';
  static const String suggestionsRoute = '/suggestions';
  static const String notificationsRoute = '/notifications';
  static const String customerServiceRoute = '/customerService';
  static const String technicalSupportRoute = '/technicalSupport';
  static const String complaintScreenRoute = '/complaintScreen';
  static const String frequentlyAskedQuestionsRoute = '/frequentlyAskedQuestions';
  static const String userGuideRoute = '/userGuide';
  static const String lastOperationsRoute = '/lastOperations';
  static const String invoiceDetailsRoute = '/invoiceDetails';
  static const String consultationScreenRoute = '/consultation';
  static const String spHomeScreenRoute = '/spHomeScreen';
  static const String spRequestDetailsRoute = '/spRequestDetails';
  static const String requestImplementRoute = '/requestImplement';
  static const String spPersonalDetailsRoute = '/spPersonalDetails';
  static const String spCompletedRequestsRoute = '/spCompletedRequests';
  static const String calenderRoute = '/calender';
  static const String messagesRoute = '/messages';
  static const String serviceProviderRegisterRoute = '/serviceProviderRegister';
  static const String registerInstitutionRoute = '/registerInstitution';
  static const String registerTechnicianRoute = '/registerTechnician';
  static const String aboutUsRoute = '/aboutUs';
  static const String cinemaDetailsRoute = '/cinemaDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingOneRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingOne_Screen());
      case Routes.onBoardingTwoRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingTwo_Screen());
      case Routes.onBoardingThreeRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingThree_Screen());
      case Routes.getStartedRoute:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());
      case Routes.completeProfileRoute:
        return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
      // case Routes.verifyOTPRoute:
      //   return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.personalDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ProfileDetailsScreen());
      case Routes.walletDetailsRoute:
        return MaterialPageRoute(builder: (_) => const WalletDetailsScreen());
      case Routes.requestDetailsRoute:
        return MaterialPageRoute(builder: (_) => const RequestDetailsScreen());
      case Routes.cardsManagementRoute:
        return MaterialPageRoute(builder: (_) => Cards_Management_Screen());
      case Routes.offerDetailsRoute:
        return MaterialPageRoute(builder: (_) => const OfferDetailsScreen());
      // case Routes.serviceTypeRoute:
      //   return MaterialPageRoute(builder: (_) => const ServiceTypeScreen());
      case Routes.serviceDetailsRoute:
        return MaterialPageRoute(builder: (_) => ServiceDetailsScreen());
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case Routes.termsAndConditionsRoute:
        return MaterialPageRoute(builder: (_) => const TermsConditionsScreen());
      case Routes.suggestionsRoute:
        return MaterialPageRoute(builder: (_) => const SuggestionsScreen());
      case Routes.notificationsRoute:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case Routes.customerServiceRoute:
        return MaterialPageRoute(builder: (_) => const CustomerServiceScreen());
      case Routes.technicalSupportRoute:
        return MaterialPageRoute(builder: (_) => const TechnicalSupportScreen());
      case Routes.complaintScreenRoute:
        return MaterialPageRoute(builder: (_) => ComplaintScreen());
      case Routes.frequentlyAskedQuestionsRoute:
        return MaterialPageRoute(builder: (_) => const FAQScreen());
      case Routes.userGuideRoute:
        return MaterialPageRoute(builder: (_) => const UserGuideScreen());
      case Routes.lastOperationsRoute:
        return MaterialPageRoute(builder: (_) => LastOperationsScreen());
      case Routes.invoiceDetailsRoute:
        return MaterialPageRoute(builder: (_) => const InvoiceDetailsScreen());
      // case Routes.consultationScreenRoute:
      //   return MaterialPageRoute(builder: (_) => ConsultationScreen());
      case Routes.spHomeScreenRoute:
        return MaterialPageRoute(builder: (_) => SpHomeScreen());
      case Routes.spRequestDetailsRoute:
        return MaterialPageRoute(builder: (_) => SpRequestDetailsScreen());
      case Routes.requestImplementRoute:
        return MaterialPageRoute(builder: (_) => const SpImplementRequestScreen());
      case Routes.spPersonalDetailsRoute:
        return MaterialPageRoute(builder: (_) => const SpProfileDetailsScreen());
      case Routes.spCompletedRequestsRoute:
        return MaterialPageRoute(builder: (_) => SpCompletedrequestsScreen());
      case Routes.calenderRoute:
        return MaterialPageRoute(builder: (_) => CalenderScreen());
      case Routes.messagesRoute:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case Routes.serviceProviderRegisterRoute:
        return MaterialPageRoute(builder: (_) => const ServiceProviderRegisterScreen());
      case Routes.registerTechnicianRoute:
        return MaterialPageRoute(builder: (_) => const RegisterTechnicianScreen());
      case Routes.registerInstitutionRoute:
        return MaterialPageRoute(builder: (_) => const RegisterInstitutionScreen());
      case Routes.aboutUsRoute:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      // case Routes.cinemaDetailsRoute:
      //   return MaterialPageRoute(builder: (_) => const CinemaDetailsScreen());

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
