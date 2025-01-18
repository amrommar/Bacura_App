import 'package:bacura_app/core/utils/index.dart';

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
