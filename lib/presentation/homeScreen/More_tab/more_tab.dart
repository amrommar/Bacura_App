import 'package:bacura_app/presentation/homeScreen/More_tab/custom_more_row.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class More_Tab extends StatefulWidget {
  const More_Tab({super.key});

  @override
  State<More_Tab> createState() => _More_TabState();
}

class _More_TabState extends State<More_Tab> {
  List<String> texts = [
    AppStrings.language_and_theme_settings,
    AppStrings.who_are_we,
    AppStrings.technical_support,
    AppStrings.terms_and_conditions,
    AppStrings.privacy_policy,
    AppStrings.register_as_a_service_provider,
    AppStrings.suggestions,
    AppStrings.appRating,
  ];

  _launchURL() async {
    final Uri url =
        Uri.parse('https://www.google.com'); // Change to your desired URL
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Custom_More_row(text: AppStrings.card_and_wallet_management),
          Custom_More_row(text: AppStrings.language_and_theme_settings),
          Custom_More_row(text: AppStrings.who_are_we),
          Custom_More_row(text: AppStrings.technical_support),
          Custom_More_row(text: AppStrings.terms_and_conditions),
          Custom_More_row(text: AppStrings.privacy_policy),
          Custom_More_row(text: AppStrings.register_as_a_service_provider),
          Custom_More_row(text: AppStrings.suggestions),
          Custom_More_row(text: AppStrings.appRating),
          Container(
            padding: EdgeInsets.only(
              left: AppPadding.p12,
              right: AppPadding.p12,
              top: AppPadding.p12,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://bacuratec.com/ar/?srsltid=AfmBOoqrtsKPaKM2iJCb48kq_YBiJCFatS1WpeifJQls7AO7HS4cgqNU');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                    ;
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(AppStrings.bacura_store,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: ColorManager.darkBlueColor,
                                    fontWeight: FontWeight.bold)),
                      ),
                      Icon(
                        Icons.store_outlined,
                        size: 30,
                        color: ColorManager.primaryBlueColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorManager.lightBlueColor,
                  thickness: 1,
                )
              ],
            ),
          ),
          SizedBox(height: 70.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p6),
                  child: Icon(Icons.ios_share,
                      color: ColorManager.blackColor, size: 30)),
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p6),
                  child: Icon(Icons.facebook_outlined,
                      color: ColorManager.primaryBlueColor, size: 35)),
              Container(
                margin: EdgeInsets.all(AppMargin.m6),
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/images/twitter_logo.png',
                ),
              ),
              Container(
                  margin: EdgeInsets.all(AppMargin.m6),
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/images/instagram_logo.png', // Use the SVG path
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
