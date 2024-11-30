import 'package:bacura_app/feature/more/presentation/views/widgets/user_guide_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserGuideView extends StatefulWidget {
  const UserGuideView({super.key});

  @override
  State<UserGuideView> createState() => _UserGuideViewState();
}

class _UserGuideViewState extends State<UserGuideView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.user_guide),
      ),
      body: const UserGuideViewBody(),
    );
  }
}
