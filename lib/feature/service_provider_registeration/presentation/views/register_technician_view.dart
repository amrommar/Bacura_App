import 'package:bacura_app/feature/service_provider_registeration/presentation/views/widgets/register_technician_view_body.dart';
import 'package:flutter/material.dart';

class RegisterTechnicianView extends StatelessWidget {
  const RegisterTechnicianView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Technician'),
      ),
      body: const RegisterTechnicianViewBody(),
    );
  }
}
