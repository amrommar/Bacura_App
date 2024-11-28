import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsConditionsCheck extends StatefulWidget {
  const TermsConditionsCheck({super.key});

  @override
  State<TermsConditionsCheck> createState() => _TermsConditionsCheckState();
}

class _TermsConditionsCheckState extends State<TermsConditionsCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: ColorManager.whiteColor,
      activeColor: ColorManager.primaryBlueColor,
      title: Text(AppLocalizations.of(context)!.accept_the_privacy_policy_and_terms_and_conditions,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ColorManager.greyColor,
              )),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
