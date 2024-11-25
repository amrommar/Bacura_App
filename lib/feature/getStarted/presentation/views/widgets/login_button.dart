import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.loginRoute);
      },
      child: Text(
        AppLocalizations.of(context)!.login,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
