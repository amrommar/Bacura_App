import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsIntroduction extends StatelessWidget {
  const TermsIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.terms_intro,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: ColorManager.darkBlueColor,
          ),
      maxLines: null, // Allows unlimited lines
      textAlign: TextAlign.justify,
    );
  }
}
