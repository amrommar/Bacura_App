import 'package:bacura_app/feature/more/views/widgets/complaints_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Complaint_View extends StatefulWidget {
  @override
  State<Complaint_View> createState() => _Complaint_ViewState();
}

class _Complaint_ViewState extends State<Complaint_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.complaints)),
      body: ComplaintsViewBody(),
    );
  }
}
