import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/service_provider_register_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceProviderRegisterViewBody extends StatelessWidget {
  const ServiceProviderRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      ServiceProviderRegisterContainer(
          iconData: Icons.account_circle,
          title: 'Register As a Technician',
          description: '''Join our team of distinguished technicians!
Are you a distinguished technical technician?
If you are an expert in installing smart systems, cameras, networks or control systems, register now and we will contact you soon!''',
          note:
              '''Note: Registration does not mean final acceptance, there are criteria and conditions to join our team.''',
          onTap: () {
            Navigator.pushNamed(context, Routes.registerTechnicianRoute);
          }),
      const SizedBox(height: 20),
      ServiceProviderRegisterContainer(
          iconData: FontAwesomeIcons.building,
          title: 'Register as an Institution',
          description: '''If you own an institution and need to follow up on your technicians in a distinctive way? 
                   
Register with us and follow up on every step of the work with your team with complete transparency and professionalism.''',
          note: '',
          onTap: () {
            Navigator.pushNamed(context, Routes.registerInstitutionRoute);
          })
    ]);
  }
}
