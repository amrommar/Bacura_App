import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContinueAsVisitorButton extends StatelessWidget {
  const ContinueAsVisitorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorManager.lightBlueColor),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreenRoute, (Route<dynamic> route) => false);
        },
        child: Text(AppLocalizations.of(context)!.continue_as_a_visitor,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor)));
  }
}
