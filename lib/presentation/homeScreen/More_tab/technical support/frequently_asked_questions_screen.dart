import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FrequentlyAskedQuestions_Screen extends StatefulWidget {
  const FrequentlyAskedQuestions_Screen({super.key});

  @override
  State<FrequentlyAskedQuestions_Screen> createState() => _FrequentlyAskedQuestions_ScreenState();
}

class _FrequentlyAskedQuestions_ScreenState extends State<FrequentlyAskedQuestions_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.frequently_asked_questions),
      ),
      body: Center(
        child: Icon(Icons.question_mark_outlined, size: 150, color: ColorManager.primaryBlueColor),
      ),
    );
  }
}
