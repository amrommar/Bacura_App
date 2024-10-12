import 'package:bacura_app/presentation/homeScreen/More_tab/custom_more_row.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
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
          SizedBox(height: 20.h),
          Custom_More_row(
              text: AppStrings.cardsManagement,
              onTap: () {
                Navigator.pushNamed(context, Routes.cardsManagementRoute);
              }),
          Custom_More_row(text: AppStrings.who_are_we, onTap: () {}),
          Custom_More_row(text: AppStrings.technical_support, onTap: () {}),
          Custom_More_row(text: AppStrings.terms_and_conditions, onTap: () {}),
          Custom_More_row(text: AppStrings.privacy_policy, onTap: () {}),
          Custom_More_row(
              text: AppStrings.register_as_a_service_provider, onTap: () {}),
          Custom_More_row(text: AppStrings.suggestions, onTap: () {}),

          Custom_More_row(text: AppStrings.appRating, onTap: () {}),

          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p6),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(AppStrings.app_Language,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.blackColor)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      child: Text('EN',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: ColorManager.primaryBlueColor,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Divider(
                  color: ColorManager.lightBlueColor,
                  thickness: 1,
                )
              ],
            ),
          ),

          /// Bacura store Link /////////////////////////////////////////////////////////////
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p6),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://bacuratec.com/ar/?srsltid=AfmBOoqrtsKPaKM2iJCb48kq_YBiJCFatS1WpeifJQls7AO7HS4cgqNU');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
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
          SizedBox(height: 50.h),

          /// social Media Links /////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  child: Icon(Icons.ios_share,
                      color: ColorManager.blackColor, size: 30)),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(
                      'https://www.facebook.com/bacuratec?locale=ar_AR');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Image.asset('assets/images/facebook_logo.png',
                    height: 45, width: 45),
              ),
              // InkWell(
              //   onTap: () async {
              //     final Uri url = Uri.parse(
              //         'https://www.facebook.com/bacuratec?locale=ar_AR');
              //     if (!await launchUrl(url)) {
              //       throw Exception('Could not launch $url');
              //     }
              //   },
              //   child: Image.asset('assets/images/linkedIn_logo.png',
              //       height: 40, width: 40),
              // ),
              InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse('https://x.com/bacura_tec');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Image.asset('assets/images/x.png',
                      height: 45, width: 45)),
              InkWell(
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://www.instagram.com/bacura_tec/');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Image.asset('assets/images/instagram.png',
                      height: 45, width: 45)),
            ],
          ),
        ],
      ),
    );
  }
}
