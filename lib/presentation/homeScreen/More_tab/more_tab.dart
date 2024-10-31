import 'package:bacura_app/presentation/homeScreen/More_tab/appRating/app_rating_bottom_sheet.dart';
import 'package:bacura_app/presentation/homeScreen/More_tab/custom_more_row.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class More_Tab extends StatefulWidget {
  const More_Tab({super.key});

  @override
  State<More_Tab> createState() => _More_TabState();
}

class _More_TabState extends State<More_Tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(height: 20.h),

      ///cardsManagement tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.cardsManagement,
          onTap: () {
            Navigator.pushNamed(context, Routes.cardsManagementRoute);
          }),

      ///who_are_we tab //////////////////////////////
      Custom_More_row(text: AppLocalizations.of(context)!.who_are_we, onTap: () {}),

      ///technical_support tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.technical_support,
          onTap: () {
            Navigator.pushNamed(context, Routes.technicalSupportRoute);
          }),

      ///terms_and_conditions tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.terms_and_conditions,
          onTap: () {
            Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
          }),

      ///privacy_policy tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.privacy_policy,
          onTap: () {
            Navigator.pushNamed(context, Routes.privacyPolicyRoute);
          }),

      ///register_as_a_service_provider tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.register_as_a_service_provider,
          onTap: () {
            Navigator.pushNamed(context, Routes.spHomeScreenRoute);
          }),

      ///suggestions tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.suggestions,
          onTap: () {
            Navigator.pushNamed(context, Routes.suggestionsRoute);
          }),

      ///appRating tab //////////////////////////////
      Custom_More_row(
          text: AppLocalizations.of(context)!.appRating,
          onTap: () {
            showAppRatingBottomSheet();
          }),

      ///app_Language tab //////////////////////////////
      Container(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p6),
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: Text(AppLocalizations.of(context)!.app_Language,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.blackColor))),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                  child: InkWell(
                      onTap: () {
                        provider.changeLanguage();
                      },
                      child: Text(AppLocalizations.of(context)!.ar_en,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold))))
            ]),
            Divider(color: ColorManager.lightBlueColor, thickness: 1)
          ])),

      /// Bacura store Link /////////////////////////////////////////////////////////////
      Container(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p6),
          child: Column(children: [
            InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(
                      'https://bacuratec.com/ar/?srsltid=AfmBOoqrtsKPaKM2iJCb48kq_YBiJCFatS1WpeifJQls7AO7HS4cgqNU');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Row(children: [
                  Expanded(
                      child: Text(AppLocalizations.of(context)!.bacura_store,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold))),
                  Icon(Icons.store_outlined, size: 30, color: ColorManager.primaryBlueColor)
                ])),
            Divider(color: ColorManager.lightBlueColor, thickness: 1)
          ])),
      SizedBox(height: 50.h),

      /// social Media Links /////////////////////////////////////////////////////////////
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(onTap: () {}, child: Icon(Icons.ios_share, color: ColorManager.blackColor, size: 30)),
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse('https://www.facebook.com/bacuratec?locale=ar_AR');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Image.asset('assets/images/facebook_logo.png', height: 45, width: 45),
        ),
        InkWell(
            onTap: () async {
              final Uri url = Uri.parse('https://x.com/bacura_tec');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Image.asset('assets/images/x.png', height: 45, width: 45)),
        InkWell(
            onTap: () async {
              final Uri url = Uri.parse('https://www.instagram.com/bacura_tec/');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Image.asset('assets/images/instagram.png', height: 45, width: 45)),
      ])
    ]));
  }

  void showAppRatingBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AppRating_BottomSheet();
        });
  }
}
