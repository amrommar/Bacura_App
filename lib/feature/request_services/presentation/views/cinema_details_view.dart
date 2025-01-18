import 'package:bacura_app/core/utils/index.dart';

class CinemaDetailsView extends StatefulWidget {
  const CinemaDetailsView({super.key});

  @override
  State<CinemaDetailsView> createState() => _CinemaDetailsViewState();
}

class _CinemaDetailsViewState extends State<CinemaDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.service_details,
        )),
        body: const CinemaDetailsViewBody());
  }
}
