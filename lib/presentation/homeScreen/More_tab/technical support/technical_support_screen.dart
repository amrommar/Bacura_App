import 'package:bacura_app/presentation/homeScreen/More_tab/custom_more_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/routes_manager.dart';

class TechnicalSupport_Screen extends StatefulWidget {
  @override
  State<TechnicalSupport_Screen> createState() => _TechnicalSupport_ScreenState();
}

class _TechnicalSupport_ScreenState extends State<TechnicalSupport_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.technical_support)),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: 20.h),

          ///Frequently asked questions tab //////////////////////////////
          Custom_More_row(
              text: AppLocalizations.of(context)!.frequently_asked_questions,
              onTap: () {
                Navigator.pushNamed(context, Routes.frequentlyAskedQuestionsRoute);
              }),

          ///Complaints tab //////////////////////////////
          Custom_More_row(
              text: AppLocalizations.of(context)!.complaints,
              onTap: () {
                Navigator.pushNamed(context, Routes.complaintScreenRoute);
              }),

          ///User Guide tab //////////////////////////////
          Custom_More_row(
              text: AppLocalizations.of(context)!.user_guide,
              onTap: () {
                Navigator.pushNamed(context, Routes.userGuideRoute);
              })
        ])));
  }
}
