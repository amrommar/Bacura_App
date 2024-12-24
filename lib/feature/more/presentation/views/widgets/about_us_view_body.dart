import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/bacura_logo_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            AppLocalizations.of(context)!.about_us,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
            textAlign: TextAlign.justify,
          ),
          Divider(color: ColorManager.whiteColor),
          Text(
            AppLocalizations.of(context)!.about_us_body,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.our_website,
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
