import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/register_institution_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterInstitutionView extends StatelessWidget {
  const RegisterInstitutionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_institution),
      ),
      body: RegisterInstitutionViewBody(),
    );
  }
}
