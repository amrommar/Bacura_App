import 'package:bacura_app/feature/request_services/presentation/views/widgets/service_type_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceType_Screen extends StatefulWidget {
  @override
  State<ServiceType_Screen> createState() => _ServiceType_ScreenState();
}

class _ServiceType_ScreenState extends State<ServiceType_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.service_type),
        elevation: 0,
      ),
      body: const ServiceTypeViewBody(),
    );
  }
}

/// container have circle icon and text ////////////////////////////////////
