import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class MoreTabScreen extends StatefulWidget {
  const MoreTabScreen({super.key});

  @override
  State<MoreTabScreen> createState() => _MoreTabScreenState();
}

class _MoreTabScreenState extends State<MoreTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(height: AppSizes.ph10),

      ///who_are_we tab //////////////////////////////
      CustomMoreRowWidget(
        widget: CircleAvatar(
            radius: AppSizes.br14,
            backgroundColor: ColorManager.whiteColor,
            ///////////////    from Back-End     /////////////////////
            child: Image.asset(AppAssets.bacuraImage) // Adjust the radius to make sure it fits
            ),
        text: tr(AppStrings.aboutBacuraApp),
        onTap: () {
          Navigator.pushNamed(context, Routes.aboutUsRoute);
        },
      ),

      ///technical_support tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.info_outline, size: AppSizes.ph24, color: ColorManager.midRedColor),
          text: tr(AppStrings.technicalSupport),
          onTap: () {
            Navigator.pushNamed(context, Routes.technicalSupportRoute);
          }),

      ///terms_and_conditions tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.article, size: AppSizes.ph24, color: ColorManager.lightGreyColor),
          text: tr(AppStrings.termsAndConditions),
          onTap: () {
            Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
          }),

      ///privacy_policy tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.privacy_tip, size: AppSizes.ph24, color: ColorManager.lightGreyColor),
          text: tr(AppStrings.privacyPolicy),
          onTap: () {
            Navigator.pushNamed(context, Routes.privacyPolicyRoute);
          }),

      ///register_as_a_service_provider tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.account_circle, size: AppSizes.ph24, color: ColorManager.primaryBlueColor),
          text: tr(AppStrings.registerAsServiceProvider),
          onTap: () async {
            final Uri url = Uri.parse(
              'https://sustainable-assets.sa/bacura-form/index.html',
            );
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          }),

      ///suggestions tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.lightbulb, size: AppSizes.ph24, color: ColorManager.yellowColor),
          text: tr(AppStrings.suggestions),
          onTap: () {
            Navigator.pushNamed(context, Routes.suggestionsRoute);
          }),

      ///appRating tab //////////////////////////////
      CustomMoreRowWidget(
        widget: Icon(Icons.star_border_outlined, size: AppSizes.ph24, color: ColorManager.yellowColor),
        text: tr(AppStrings.rateApp),
        onTap: () {},

        /// method for app rating
      ),

      ///app_Language tab //////////////////////////////
      const ChangeLanguageRowWidget(),
      SizedBox(height: AppSizes.ph40),

      /// Bacura store Link /////////////////////////////////////////////////////////////
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BacuraStoreWidget(),
          ShareAppWidget(),
        ],
      ),
      SizedBox(height: AppSizes.ph60),

      /// social Media Links /////////////////////////////////////////////////////////////
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SocialMediaWidget(
          imagePath: AppAssets.xLogo,
          path: AppAssets.bacuraXURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.linkedInLogo,
          path: AppAssets.bacuraLinkedInURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.facebookLogo,
          path: AppAssets.bacuraFacebookURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.snapLogo,
          path: AppAssets.bacuraSnapURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.instagramLogo,
          path: AppAssets.bacuraInstagramURL,
        ),
      ])
    ]));
  }
}
