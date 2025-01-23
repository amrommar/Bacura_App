import 'package:bacura_app/core/utils/index.dart';

class ServiceProviderRegisterScreen extends StatelessWidget {
  const ServiceProviderRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_as_a_service_provider),
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
