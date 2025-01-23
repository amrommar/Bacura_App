import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class TechnicalSupportScreen extends StatefulWidget {
  @override
  State<TechnicalSupportScreen> createState() => _TechnicalSupportScreenState();
}

class _TechnicalSupportScreenState extends State<TechnicalSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.technical_support)),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: 10.h),

          ///Frequently asked questions tab //////////////////////////////
          CustomSupportContainerWidget(
              widget: Image.asset('assets/images/question.png', height: 80),
              text: AppLocalizations.of(context)!.frequently_asked_questions,
              onTap: () {
                Navigator.pushNamed(context, Routes.frequentlyAskedQuestionsRoute);
              }),

          ///Complaints tab //////////////////////////////
          CustomSupportContainerWidget(
              widget: Image.asset('assets/images/bad-feedback.png', height: 80),
              text: AppLocalizations.of(context)!.complaints,
              onTap: () {
                Navigator.pushNamed(context, Routes.complaintScreenRoute);
              }),

          ///User Guide tab //////////////////////////////
          CustomSupportContainerWidget(
              widget: Image.asset('assets/images/manual-book.png', height: 80),
              text: AppLocalizations.of(context)!.user_guide,
              onTap: () {
                Navigator.pushNamed(context, Routes.userGuideRoute);
              }),
          SizedBox(height: 70.h),
          const BacuraLogoWidget()
        ])));
  }
}
