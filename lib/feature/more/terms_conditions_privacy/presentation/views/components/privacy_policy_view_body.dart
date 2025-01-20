import 'package:bacura_app/core/utils/index.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorManager.lightBlueColor,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          )
        ], borderRadius: BorderRadius.circular(12), color: ColorManager.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //// from Back-End /////////////////////////////////////////////////
            const PrivacyPolicyIntro(),
            Divider(color: ColorManager.whiteColor, thickness: 1),

            ///// 1. Collection information /////////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.privacy_collection_of_information),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.privacy_collection_of_information_content),

            Divider(color: ColorManager.whiteColor),
            ////2. Protection of Information: /////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.privacy_information_protection),

            Divider(color: ColorManager.lightBlueColor, thickness: 1),
            ContentWidget(content: AppLocalizations.of(context)!.privacy_information_protection_content),

            Divider(color: ColorManager.whiteColor),
            ////3. Sharing Information: /////////////////////////////////////////////////////////
            TitleWidget(title: AppLocalizations.of(context)!.privacy_sharing_information),
            Divider(color: ColorManager.lightBlueColor, thickness: 1),
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
    );
  }
}
