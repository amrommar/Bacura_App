import 'package:bacura_app/core/utils/index.dart';

class TermsConditionsViewBody extends StatelessWidget {
  const TermsConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          color: ColorManager.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TermsIntroduction(),
            Divider(color: ColorManager.whiteColor),
            ///// 1. Definitions /////////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.terms_definitions),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.terms_definitions_content),
            Divider(color: ColorManager.whiteColor),
            ////2. Terms of Use /////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.terms_of_use),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.terms_of_use_content),
            Divider(color: ColorManager.whiteColor),
            ////3. Intellectual Property Rights /////////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.intellectual_property_rights),

            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.terms_copyrights_content),
            Divider(color: ColorManager.whiteColor),

            ///4. Limitation of Liability ./////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.terms_limitation_of_liability),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.terms_limitation_of_liability_content),
            Divider(color: ColorManager.whiteColor),
            ////5. User Rights: /////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.terms_changes),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.terms_changes_content),
            Divider(color: ColorManager.whiteColor),
            ////6. Contact Us /////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.contact_us),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.contact_us_content),
          ],
        ),
      ),
    );
  }
}
