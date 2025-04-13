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
          title: Text(
        tr(AppStrings.privacyPolicy),
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
              //// from Back-End /////////////////////////////////////////////////
              const PrivacyPolicyIntro(),
              Divider(
                color: ColorManager.whiteColor,
                thickness: AppSizes.ph1,
              ),

              ///// 1. Collection information /////////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.privacyCollectionOfInformation),
              ),
              Divider(
                color: ColorManager.lightBlueColor,
                thickness: AppSizes.ph1,
              ),
              ContentWidget(
                content: tr(AppStrings.privacyCollectionOfInformationContent),
              ),

              Divider(color: ColorManager.whiteColor),
              ////2. Protection of Information: /////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.privacyInformationProtection),
              ),

              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(
                content: tr(AppStrings.privacyInformationProtectionContent),
              ),

              Divider(color: ColorManager.whiteColor),
              ////3. Sharing Information: /////////////////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.privacySharingInformation),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph1),
              ContentWidget(
                content: tr(AppStrings.privacySharingInformationContent),
              ),

              Divider(color: ColorManager.whiteColor),

              ///4. Changes to the Privacy Policy: ./////////////////////////////////////////////
              TitleWidget(
                title: tr(AppStrings.changesToThePrivacyPolicy),
              ),

              Divider(color: ColorManager.lightBlueColor),
              ContentWidget(
                content: tr(AppStrings.changesToThePrivacyPolicyContent),
              ),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////

              TitleWidget(
                title: tr(AppStrings.privacyUserRights),
              ),

              Divider(color: ColorManager.lightBlueColor),

              ContentWidget(
                content: tr(AppStrings.privacyUserRightsContent),
              ),

              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////

              TitleWidget(
                title: tr(AppStrings.contactUs),
              ),

              Divider(color: ColorManager.lightBlueColor),
              ContentWidget(
                content: tr(AppStrings.contactUsContent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
