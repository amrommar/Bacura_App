import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/service_provider_register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceProviderRegisterView extends StatelessWidget {
  const ServiceProviderRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_as_a_service_provider),
      ),
      body: const ServiceProviderRegisterViewBody(),
    );
  }
}
