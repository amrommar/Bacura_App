import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/auth/presetation/views/widgets/bacura_logo_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: ColorManager.midWhiteColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BacuraLogoContainer(),
          Divider(color: ColorManager.whiteColor),
          Text(
            '''With Bacura, We provide you with an integrated solution to manage your Technical, Smart and Security needs with ease and professionalism. Whether you are looking to install High-Quality Surveillance Cameras, Smart Systems, or Innovative Technical Solutions for your Home or Workplace, our Application is the Perfect Choice.''',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
            textAlign: TextAlign.justify,
          ),
          Divider(color: ColorManager.whiteColor),
          Text(
            '''We guarantee you High-Quality Technical Services with Efficiency and speed of implementation, with a professional Team around the clock and continuous Technical Support, your Security and Comfort are now at your Fingertips.''',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Text(
                'Our Website:   ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.greyColor,
                    ),
              ),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(
                    'https://bacuratec.sa/',
                  );
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Text(
                  'https://bacuratec.sa',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager.primaryBlueColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
