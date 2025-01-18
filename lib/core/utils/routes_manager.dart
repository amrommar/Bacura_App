import 'package:bacura_app/core/utils/index.dart';

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
  static const String serviceDetailsRoute = '/serviceDetails';
  static const String privacyPolicyRoute = '/privacyPolicy';
  static const String termsAndConditionsRoute = '/termsAndConditions';
  static const String suggestionsRoute = '/suggestions';
  static const String notificationsRoute = '/notifications';
  static const String customerServiceRoute = '/customerService';
  static const String paymentScreenRoute = '/paymentScreen';
  static const String technicalSupportRoute = '/technicalSupport';
  static const String complaintScreenRoute = '/complaintScreen';
  static const String frequentlyAskedQuestionsRoute = '/frequentlyAskedQuestions';
  static const String userGuideRoute = '/userGuide';
  static const String lastOperationsRoute = '/lastOperations';
  static const String invoiceDetailsRoute = '/invoiceDetails';
  static const String consultationScreenRoute = '/consultation';
  static const String rechargeBalanceRoute = '/rechargeBalance';
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
        return MaterialPageRoute(builder: (_) => const GetstartedView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.verifyOTPRoute:
        return MaterialPageRoute(builder: (_) => const VerifyOTPView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.personalDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ProfileDetails_Screen());
      case Routes.walletDetailsRoute:
        return MaterialPageRoute(builder: (_) => const Wallet_Details());
      case Routes.requestDetailsRoute:
        return MaterialPageRoute(builder: (_) => Request_Details_Screen());
      case Routes.cardsManagementRoute:
        return MaterialPageRoute(builder: (_) => Cards_Management_Screen());
      case Routes.offerDetailsRoute:
        return MaterialPageRoute(builder: (_) => const OfferDetails_Screen());
      case Routes.serviceTypeRoute:
        return MaterialPageRoute(builder: (_) => ServiceType_Screen());
      case Routes.serviceDetailsRoute:
        return MaterialPageRoute(builder: (_) => ServiceDetails_Screen());
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());
      case Routes.termsAndConditionsRoute:
        return MaterialPageRoute(builder: (_) => const TermsConditionsView());
      case Routes.suggestionsRoute:
        return MaterialPageRoute(builder: (_) => const SuggestionsView());
      case Routes.notificationsRoute:
        return MaterialPageRoute(builder: (_) => NotificationsView());
      case Routes.customerServiceRoute:
        return MaterialPageRoute(builder: (_) => const CustomerServiceView());
      case Routes.paymentScreenRoute:
        return MaterialPageRoute(builder: (_) => Payment_Screen());
      case Routes.technicalSupportRoute:
        return MaterialPageRoute(builder: (_) => TechnicalSupportView());
      case Routes.complaintScreenRoute:
        return MaterialPageRoute(builder: (_) => Complaint_View());
      case Routes.frequentlyAskedQuestionsRoute:
        return MaterialPageRoute(builder: (_) => const FrequentlyAskedQuestionsView());
      case Routes.userGuideRoute:
        return MaterialPageRoute(builder: (_) => const UserGuideView());
      case Routes.lastOperationsRoute:
        return MaterialPageRoute(builder: (_) => LastOperations_Screen());
      case Routes.invoiceDetailsRoute:
        return MaterialPageRoute(builder: (_) => InvoiceDetailsView());
      case Routes.consultationScreenRoute:
        return MaterialPageRoute(builder: (_) => Consultation_View());
      case Routes.rechargeBalanceRoute:
        return MaterialPageRoute(builder: (_) => RechargeBalance_Screen());
      case Routes.spHomeScreenRoute:
        return MaterialPageRoute(builder: (_) => SpHomeView());
      case Routes.spRequestDetailsRoute:
        return MaterialPageRoute(builder: (_) => Sp_RequestDetails_Screen());
      case Routes.requestImplementRoute:
        return MaterialPageRoute(builder: (_) => const SpImplementRequestView());
      case Routes.spPersonalDetailsRoute:
        return MaterialPageRoute(builder: (_) => const SpProfileDetailsView());
      case Routes.spCompletedRequestsRoute:
        return MaterialPageRoute(builder: (_) => Sp_Completedrequests_Screen());
      case Routes.calenderRoute:
        return MaterialPageRoute(builder: (_) => CalenderView());
      case Routes.messagesRoute:
        return MaterialPageRoute(builder: (_) => const MessagesView());
      case Routes.serviceProviderRegisterRoute:
        return MaterialPageRoute(builder: (_) => const ServiceProviderRegisterView());
      case Routes.registerTechnicianRoute:
        return MaterialPageRoute(builder: (_) => const RegisterTechnicianView());
      case Routes.registerInstitutionRoute:
        return MaterialPageRoute(builder: (_) => const RegisterInstitutionView());
      case Routes.aboutUsRoute:
        return MaterialPageRoute(builder: (_) => const AboutUsView());
      case Routes.cinemaDetailsRoute:
        return MaterialPageRoute(builder: (_) => const CinemaDetailsView());

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
