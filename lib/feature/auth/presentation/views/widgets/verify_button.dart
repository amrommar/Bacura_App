import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyButton extends StatelessWidget {
  Function() onPressed;

  VerifyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Call the validation method
          onPressed();
        },
        child: Text(
          AppLocalizations.of(context)!.verify,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
