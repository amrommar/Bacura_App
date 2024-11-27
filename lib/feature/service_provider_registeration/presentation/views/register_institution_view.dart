import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/register_institution_view_body.dart';
import 'package:flutter/material.dart';

class RegisterInstitutionView extends StatelessWidget {
  const RegisterInstitutionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Institution'),
      ),
      body: const RegisterInstitutionViewBody(),
    );
  }
}
