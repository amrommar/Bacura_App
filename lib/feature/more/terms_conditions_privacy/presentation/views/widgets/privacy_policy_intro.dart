import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyIntro extends StatelessWidget {
  const PrivacyPolicyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context)!.privacy_policy_intro,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorManager.darkBlueColor,
            ),
        maxLines: null, // Allows unlimited lines
        textAlign: TextAlign.justify);
  }
}
