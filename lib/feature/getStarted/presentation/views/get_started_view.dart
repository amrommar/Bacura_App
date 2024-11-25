import 'package:bacura_app/core/providers/language_provider.dart';
import 'package:bacura_app/core/utils/assets_manager.dart';
import 'package:bacura_app/feature/getStarted/presentation/views/widgets/get_started_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetstartedView extends StatefulWidget {
  const GetstartedView({super.key});

  @override
  State<GetstartedView> createState() => _GetstartedViewState();
}

class _GetstartedViewState extends State<GetstartedView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Stack(children: [
      ////   background Image   ////////////////
      Image.asset(ImageAssets.background2Image),
      const Scaffold(backgroundColor: Colors.transparent, body: GetStartedViewBody())
    ]);
  }
}
