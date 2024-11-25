import 'package:bacura_app/feature/personal/presentation/views/widgets/invoice_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InvoiceDetailsView extends StatefulWidget {
  @override
  State<InvoiceDetailsView> createState() => _InvoiceDetailsViewState();
}

class _InvoiceDetailsViewState extends State<InvoiceDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.invoice,
        )),
        body: const InvoiceDetailsViewBody());
  }
}
