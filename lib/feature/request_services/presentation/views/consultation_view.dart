import 'package:bacura_app/feature/request_services/presentation/views/widgets/consultation-view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Consultation_View extends StatefulWidget {
  @override
  State<Consultation_View> createState() => _Consultation_ViewState();
}

class _Consultation_ViewState extends State<Consultation_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.consultation_screen),
        ),
        body: const ConsultationViewBody());
  }
}
