import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class BacuraStoreRow extends StatelessWidget {
  const BacuraStoreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p6),
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
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.darkBlueColor,
                              fontWeight: FontWeight.bold,
                            ))),
                Icon(
                  Icons.store_outlined,
                  size: 30,
                  color: ColorManager.primaryBlueColor,
                )
              ])),
          Divider(color: ColorManager.lightBlueColor, thickness: 1)
        ]));
  }
}
