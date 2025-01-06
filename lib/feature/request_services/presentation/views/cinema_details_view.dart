import 'package:bacura_app/feature/request_services/presentation/views/widgets/cinema_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
