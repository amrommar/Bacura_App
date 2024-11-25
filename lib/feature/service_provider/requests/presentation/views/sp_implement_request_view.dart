import 'package:bacura_app/feature/service_provider/requests/presentation/views/widgets/sp_implement_request_view_body.dart';
import 'package:flutter/material.dart';

class SpImplementRequestView extends StatefulWidget {
  const SpImplementRequestView({super.key});

  @override
  State<SpImplementRequestView> createState() => _SpImplementRequestViewState();
}

class _SpImplementRequestViewState extends State<SpImplementRequestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تنفيذ الطلب')),
      body: const SpImplementRequestViewBody(),
    );
  }
}

// Custom dashed line painter
