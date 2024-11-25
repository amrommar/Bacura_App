import 'package:bacura_app/feature/service_provider/requests/presentation/views/widgets/sp_request_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sp_RequestDetails_Screen extends StatefulWidget {
  @override
  State<Sp_RequestDetails_Screen> createState() => _Sp_RequestDetails_ScreenState();
}

class _Sp_RequestDetails_ScreenState extends State<Sp_RequestDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.request_details)),
      body: const SpRequestDetailsViewBody(),
    );
  }
}
