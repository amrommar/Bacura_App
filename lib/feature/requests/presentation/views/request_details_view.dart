import 'package:bacura_app/core/utils/index.dart';

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
