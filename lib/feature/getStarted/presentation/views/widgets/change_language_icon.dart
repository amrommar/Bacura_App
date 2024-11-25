import 'package:bacura_app/core/providers/language_provider.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ChangeLanguageIcon extends StatelessWidget {
  const ChangeLanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);

    return Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            provider.changeLanguage();
          },
          child: Text(AppLocalizations.of(context)!.ar_en,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primaryBlueColor,
                  )),
        ));
  }
}
