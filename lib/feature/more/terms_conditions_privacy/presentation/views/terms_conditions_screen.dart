import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        tr(AppStrings.termsAndConditions),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(AppSizes.ph8),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.pw12,
            vertical: AppSizes.ph20,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightBlueColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(AppSizes.br12),
            color: ColorManager.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TermsIntroduction(),
              Divider(color: ColorManager.whiteColor),
              ///// 1. Definitions /////////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.termsDefinitions),
              ),
              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(
                content: tr(AppStrings.termsDefinitionsContent),
              ),
              Divider(color: ColorManager.whiteColor),
              ////2. Terms of Use /////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.termsConditions),
              ),
              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(
                content: tr(AppStrings.termsConditionsContent),
              ),
              Divider(color: ColorManager.whiteColor),
              ////3. Intellectual Property Rights /////////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.termsCopyRights),
              ),

              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(
                content: tr(AppStrings.termsCopyRightsContent),
              ),
              Divider(color: ColorManager.whiteColor),

              ///4. Limitation of Liability ./////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.termsLimitationOfLiability),
              ),
              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(content: tr(AppStrings.termsLimitationOfLiabilityContent)),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.termsChanges),
              ),
              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(
                content: tr(AppStrings.termsChangesContent),
              ),
              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.contactUs),
              ),
              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(
                content: tr(AppStrings.contactUsContent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
