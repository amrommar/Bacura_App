import 'package:bacura_app/core/utils/index.dart';

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
