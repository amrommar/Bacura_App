import 'package:bacura_app/core/utils/index.dart';

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
