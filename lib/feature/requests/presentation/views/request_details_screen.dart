import 'package:bacura_app/core/utils/index.dart';

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({super.key});

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
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
