import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsConditionsCheck extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;

  const TermsConditionsCheck({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: ColorManager.whiteColor,
      activeColor: ColorManager.primaryBlueColor,
      title: Text(AppLocalizations.of(context)!.accept_the_privacy_policy_and_terms_and_conditions,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ColorManager.greyColor,
              )),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
