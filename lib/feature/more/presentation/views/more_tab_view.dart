import 'package:bacura_app/core/utils/index.dart';

class More_Tab extends StatefulWidget {
  const More_Tab({super.key});

  @override
  State<More_Tab> createState() => _More_TabState();
}

class _More_TabState extends State<More_Tab> {
  void _showRatingDialog() {
    double _rating = 0.0; // Temporary variable to store rating value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.app_rating),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'How would you rate our app?',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
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
                  _rating = rating; // Update rating value
                },
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Tell us more about your experience...',
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
                  const SnackBar(content: Text('Thank you for your feedback!')),
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
      SizedBox(height: 10.h),

      ///cardsManagement tab //////////////////////////////
      // Custom_More_row(
      //   widget: Icon(Icons.credit_card, color: ColorManager.lightGreyColor),
      //   text: AppLocalizations.of(context)!.cardsManagement,
      //   onTap: () {
      //     Navigator.pushNamed(context, Routes.cardsManagementRoute);
      //   },
      // ),

      ///who_are_we tab //////////////////////////////
      Custom_More_row(
        widget: CircleAvatar(
            radius: 14.w,
            backgroundColor: ColorManager.whiteColor,
            ///////////////    from Back-End     /////////////////////
            child: Image.asset('assets/images/bakura (1) 1.png') // Adjust the radius to make sure it fits
            ),
        text: AppLocalizations.of(context)!.about_bacura,
        onTap: () {
          Navigator.pushNamed(context, Routes.aboutUsRoute);
        },
      ),

      ///technical_support tab //////////////////////////////
      Custom_More_row(
          widget: Icon(Icons.info_outline, color: ColorManager.midRedColor),
          text: AppLocalizations.of(context)!.technical_support,
          onTap: () {
            Navigator.pushNamed(context, Routes.technicalSupportRoute);
          }),

      ///terms_and_conditions tab //////////////////////////////
      Custom_More_row(
          widget: Icon(Icons.article, color: ColorManager.lightGreyColor),
          text: AppLocalizations.of(context)!.terms_and_conditions,
          onTap: () {
            Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
          }),

      ///privacy_policy tab //////////////////////////////
      Custom_More_row(
          widget: Icon(Icons.privacy_tip, color: ColorManager.lightGreyColor),
          text: AppLocalizations.of(context)!.privacy_policy,
          onTap: () {
            Navigator.pushNamed(context, Routes.privacyPolicyRoute);
          }),

      ///register_as_a_service_provider tab //////////////////////////////
      Custom_More_row(
          widget: Icon(Icons.account_circle, color: ColorManager.primaryBlueColor),
          text: AppLocalizations.of(context)!.register_as_a_service_provider,
          onTap: () {
            Navigator.pushNamed(context, Routes.serviceProviderRegisterRoute);
          }),

      ///suggestions tab //////////////////////////////
      Custom_More_row(
          widget: Icon(Icons.lightbulb, color: ColorManager.yellowColor),
          text: AppLocalizations.of(context)!.suggestions,
          onTap: () {
            Navigator.pushNamed(context, Routes.suggestionsRoute);
          }),

      ///appRating tab //////////////////////////////
      Custom_More_row(
        widget: Icon(Icons.star_border_outlined, color: ColorManager.yellowColor),
        text: AppLocalizations.of(context)!.app_rating,
        onTap: _showRatingDialog,

        /// method for app rating
      ),

      ///app_Language tab //////////////////////////////
      const ChangeLanguageRow(),
      SizedBox(height: 20.h),

      /// Bacura store Link /////////////////////////////////////////////////////////////
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BacuraStoreRow(),
          SizedBox(width: 20),
          ShareAppContainer(),
        ],
      ),
      SizedBox(height: 50.h),

      /// social Media Links /////////////////////////////////////////////////////////////
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SocialMediaIcon(
          imagePath: 'assets/images/facebook_logo.png',
          path: 'https://www.facebook.com/bacuratec',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/snap-01.png',
          path: 'https://www.snapchat.com/add/bacura_tec',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/x.png',
          path: 'https://x.com/bacura_tec',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/linkin iconn.png',
          path: 'https://www.linkedin.com/company/bacura-tec',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/instagram.png',
          path: 'https://www.instagram.com/bacura_tec/',
        ),
      ])
    ]));
  }
}
