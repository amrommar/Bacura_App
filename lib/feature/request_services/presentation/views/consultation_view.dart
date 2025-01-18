import 'package:bacura_app/core/utils/index.dart';

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
