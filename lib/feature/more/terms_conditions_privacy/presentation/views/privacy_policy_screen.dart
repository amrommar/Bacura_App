import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.privacy_policy,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorManager.whiteColor,
                  ))),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(AppSizes.ph8),
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ], borderRadius: BorderRadius.circular(AppSizes.br12), color: ColorManager.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// from Back-End /////////////////////////////////////////////////
              const PrivacyPolicyIntro(),
              Divider(color: ColorManager.whiteColor, thickness: AppSizes.ph1),

              ///// 1. Collection information /////////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.privacy_collection_of_information),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.privacy_collection_of_information_content),

              Divider(color: ColorManager.whiteColor),
              ////2. Protection of Information: /////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.privacy_information_protection),

              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.privacy_information_protection_content),

              Divider(color: ColorManager.whiteColor),
              ////3. Sharing Information: /////////////////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.privacy_sharing_information),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(content: AppLocalizations.of(context)!.privacy_sharing_information_content),

              Divider(color: ColorManager.whiteColor),

              ///4. Changes to the Privacy Policy: ./////////////////////////////////////////////
              TitleWidget(title: AppLocalizations.of(context)!.changes_to_the_privacy_policy),

              Divider(color: ColorManager.lightBlueColor),
              ContentWidget(content: AppLocalizations.of(context)!.changes_to_the_privacy_policy_content),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////

              TitleWidget(title: AppLocalizations.of(context)!.privacy_user_rights),

              Divider(color: ColorManager.lightBlueColor),

              ContentWidget(content: AppLocalizations.of(context)!.privacy_user_rights_content),

              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////

              TitleWidget(title: AppLocalizations.of(context)!.contact_us),

              Divider(color: ColorManager.lightBlueColor),
              ContentWidget(content: AppLocalizations.of(context)!.contact_us_content)
            ],
          ),
        ),
      ),
    );
  }
}
