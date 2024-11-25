import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FrequentlyAskedQuestionsView extends StatefulWidget {
  const FrequentlyAskedQuestionsView({super.key});

  @override
  State<FrequentlyAskedQuestionsView> createState() => _FrequentlyAskedQuestionsViewState();
}

class _FrequentlyAskedQuestionsViewState extends State<FrequentlyAskedQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.frequently_asked_questions,
      )),
      body: Center(
        child: Icon(
          Icons.question_mark_outlined,
          size: 150,
          color: ColorManager.primaryBlueColor,
        ),
      ),
    );
  }
}
