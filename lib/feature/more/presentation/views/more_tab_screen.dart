import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class MoreTabScreen extends StatefulWidget {
  const MoreTabScreen({super.key});

  @override
  State<MoreTabScreen> createState() => _MoreTabScreenState();
}

class _MoreTabScreenState extends State<MoreTabScreen> {
  void _showRatingDialog() {
    double rating = 0.0; // Temporary variable to store rating value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.app_rating),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.howWouldYouRateOurApp,
                style: TextStyle(fontSize: AppSizes.sp16),
              ),
              SizedBox(height: AppSizes.ph20),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating = rating; // Update rating value
                },
              ),
              SizedBox(height: AppSizes.ph10),
              const TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.tellUsMoreAboutYourExperience,
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle rating submission
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(AppStrings.thankYouForYourFeedback)),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.send,
                style: TextStyle(color: ColorManager.whiteColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(height: AppSizes.ph10),

      ///cardsManagement tab //////////////////////////////
      // Custom_More_row(
      //   widget: Icon(Icons.credit_card, color: ColorManager.lightGreyColor),
      //   text: AppLocalizations.of(context)!.cardsManagement,
      //   onTap: () {
      //     Navigator.pushNamed(context, Routes.cardsManagementRoute);
      //   },
      // ),

      ///who_are_we tab //////////////////////////////
      CustomMoreRowWidget(
        widget: CircleAvatar(
            radius: AppSizes.br14,
            backgroundColor: ColorManager.whiteColor,
            ///////////////    from Back-End     /////////////////////
            child: Image.asset(AppAssets.bacuraImage) // Adjust the radius to make sure it fits
            ),
        text: AppLocalizations.of(context)!.about_bacura,
        onTap: () {
          Navigator.pushNamed(context, Routes.aboutUsRoute);
        },
      ),

      ///technical_support tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.info_outline, color: ColorManager.midRedColor),
          text: AppLocalizations.of(context)!.technical_support,
          onTap: () {
            Navigator.pushNamed(context, Routes.technicalSupportRoute);
          }),

      ///terms_and_conditions tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.article, color: ColorManager.lightGreyColor),
          text: AppLocalizations.of(context)!.terms_and_conditions,
          onTap: () {
            Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
          }),

      ///privacy_policy tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.privacy_tip, color: ColorManager.lightGreyColor),
          text: AppLocalizations.of(context)!.privacy_policy,
          onTap: () {
            Navigator.pushNamed(context, Routes.privacyPolicyRoute);
          }),

      ///register_as_a_service_provider tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.account_circle, color: ColorManager.primaryBlueColor),
          text: AppLocalizations.of(context)!.register_as_a_service_provider,
          onTap: () {
            Navigator.pushNamed(context, Routes.serviceProviderRegisterRoute);
          }),

      ///suggestions tab //////////////////////////////
      CustomMoreRowWidget(
          widget: Icon(Icons.lightbulb, color: ColorManager.yellowColor),
          text: AppLocalizations.of(context)!.suggestions,
          onTap: () {
            Navigator.pushNamed(context, Routes.suggestionsRoute);
          }),

      ///appRating tab //////////////////////////////
      CustomMoreRowWidget(
        widget: Icon(Icons.star_border_outlined, color: ColorManager.yellowColor),
        text: AppLocalizations.of(context)!.app_rating,
        onTap: _showRatingDialog,

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
          imagePath: AppAssets.snapLogo,
          path: AppAssets.bacuraSnapURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.xLogo,
          path: AppAssets.bacuraXURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.linkedInLogo,
          path: AppAssets.bacuraLinkedInURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.instagramLogo,
          path: AppAssets.bacuraInstagramURL,
        ),
        SocialMediaWidget(
          imagePath: AppAssets.facebookLogo,
          path: AppAssets.bacuraFacebookURL,
        ),
      ])
    ]));
  }
}
