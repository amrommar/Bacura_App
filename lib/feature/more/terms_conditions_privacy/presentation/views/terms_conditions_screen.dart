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
        AppLocalizations.of(context)!.terms_and_conditions,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorManager.whiteColor,
            ),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(AppSizes.ph8),
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph20),
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
              TitleWidget(title: AppLocalizations.of(context)!.terms_definitions),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.terms_definitions_content),
              Divider(color: ColorManager.whiteColor),
              ////2. Terms of Use /////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.terms_of_use),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.terms_of_use_content),
              Divider(color: ColorManager.whiteColor),
              ////3. Intellectual Property Rights /////////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.intellectual_property_rights),

              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.terms_copyrights_content),
              Divider(color: ColorManager.whiteColor),

              ///4. Limitation of Liability ./////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.terms_limitation_of_liability),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.terms_limitation_of_liability_content),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.terms_changes),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.terms_changes_content),
              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.contact_us),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.contact_us_content),
            ],
          ),
        ),
      ),
    );
  }
}
