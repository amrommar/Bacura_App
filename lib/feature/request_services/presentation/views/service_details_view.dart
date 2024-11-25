import 'package:bacura_app/feature/request_services/presentation/views/widgets/service_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceDetails_Screen extends StatefulWidget {
  @override
  State<ServiceDetails_Screen> createState() => _ServiceDetails_ScreenState();
}

class _ServiceDetails_ScreenState extends State<ServiceDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.service_details,
        )),
        body: const ServiceDetailsViewBody());
  }
}
