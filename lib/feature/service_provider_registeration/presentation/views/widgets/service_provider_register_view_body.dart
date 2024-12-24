import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/service_provider_register_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceProviderRegisterViewBody extends StatelessWidget {
  const ServiceProviderRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 20),
        ServiceProviderRegisterContainer(
            iconData: Icons.account_circle,
            title: AppLocalizations.of(context)!.register_as_technician,
            description: AppLocalizations.of(context)!.register_as_technician_info,
            note: AppLocalizations.of(context)!.register_as_technician_note,
            onTap: () {
              Navigator.pushNamed(context, Routes.registerTechnicianRoute);
            }),
        const SizedBox(height: 20),
        ServiceProviderRegisterContainer(
            iconData: FontAwesomeIcons.building,
            title: AppLocalizations.of(context)!.register_as_partner,
            description: AppLocalizations.of(context)!.register_as_partner_info,
            note: '',
            onTap: () {
              Navigator.pushNamed(context, Routes.registerInstitutionRoute);
            })
      ]),
    );
  }
}
