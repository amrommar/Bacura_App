import 'package:bacura_app/feature/requests/presetation/views/widgets/request_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Request_Details_Screen extends StatefulWidget {
  @override
  State<Request_Details_Screen> createState() => _Request_Details_ScreenState();
}

class _Request_Details_ScreenState extends State<Request_Details_Screen> {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as RequestDetailsArguments;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.request_details,
        )),
        body: const RequestDetailsViewBody());
  }
}
