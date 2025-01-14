import 'package:bacura_app/feature/auth/presentation/views/widgets/bacura_logo_container.dart';
import 'package:bacura_app/feature/more/presentation/views/widgets/custom_support_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/routes_manager.dart';

class TechnicalSupportView extends StatefulWidget {
  @override
  State<TechnicalSupportView> createState() => _TechnicalSupportViewState();
}

class _TechnicalSupportViewState extends State<TechnicalSupportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.technical_support)),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: 10.h),

          ///Frequently asked questions tab //////////////////////////////
          CustomSupportContainer(
              widget: Image.asset('assets/images/question.png', height: 80),
              text: AppLocalizations.of(context)!.frequently_asked_questions,
              onTap: () {
                Navigator.pushNamed(context, Routes.frequentlyAskedQuestionsRoute);
              }),

          ///Complaints tab //////////////////////////////
          CustomSupportContainer(
              widget: Image.asset('assets/images/bad-feedback.png', height: 80),
              text: AppLocalizations.of(context)!.complaints,
              onTap: () {
                Navigator.pushNamed(context, Routes.complaintScreenRoute);
              }),

          ///User Guide tab //////////////////////////////
          CustomSupportContainer(
              widget: Image.asset('assets/images/manual-book.png', height: 80),
              text: AppLocalizations.of(context)!.user_guide,
              onTap: () {
                Navigator.pushNamed(context, Routes.userGuideRoute);
              }),
          SizedBox(height: 70.h),
          const BacuraLogoContainer()
        ])));
  }
}
