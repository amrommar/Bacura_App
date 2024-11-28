import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/more/views/widgets/bacura_store_row.dart';
import 'package:bacura_app/feature/more/views/widgets/change_language_row.dart';
import 'package:bacura_app/feature/more/views/widgets/custom_more_row.dart';
import 'package:bacura_app/feature/more/views/widgets/share_app_container.dart';
import 'package:bacura_app/feature/more/views/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class More_Tab extends StatefulWidget {
  const More_Tab({super.key});

  @override
  State<More_Tab> createState() => _More_TabState();
}

class _More_TabState extends State<More_Tab> {
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
        onTap: () {},
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
          onTap: () {
            /// method for app rating
          }),

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
          path: 'https://www.facebook.com/bacuratec?locale=ar_AR',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/x.png',
          path: 'https://x.com/bacura_tec',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/instagram.png',
          path: 'https://www.instagram.com/bacura_tec/',
        ),
        SocialMediaIcon(
          imagePath: 'assets/images/linkedIn_logo.png',
          path: 'https://www.instagram.com/bacura_tec/',
        ),
      ])
    ]));
  }
}
