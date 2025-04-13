import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class UserGuideScreen extends StatefulWidget {
  const UserGuideScreen({super.key});

  @override
  State<UserGuideScreen> createState() => _UserGuideScreenState();
}

class _UserGuideScreenState extends State<UserGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(AppStrings.userGuide),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.pw16,
            vertical: AppSizes.ph12,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BacuraLogoWidget(),
                SizedBox(height: AppSizes.ph10),
                Container(
                  padding: EdgeInsets.all(AppSizes.ph8),
                  decoration: BoxDecoration(
                    color: ColorManager.lightWhiteColor,
                    borderRadius: BorderRadius.circular(AppSizes.br12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: AppSizes.ph10),
                      UserGuideTitle(title: tr(AppStrings.welcomeToBacuraTec)),
                      SizedBox(height: AppSizes.ph10),
                      UserGuideContent(
                        content: tr(AppStrings.welcomeToBacuraTecContent),
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph2),
                Container(
                    padding: EdgeInsets.all(AppSizes.br8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(AppSizes.br12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.ph10),
                        UserGuideTitle(title: tr(AppStrings.startYourJourney)),
                        SizedBox(height: AppSizes.ph10),
                        UserGuideContent(
                          content: tr(AppStrings.startYourJourneyContent),
                        ),
                      ],
                    )),
                Divider(
                  color: ColorManager.lightBlueColor,
                  thickness: AppSizes.ph2,
                ),
                Container(
                    padding: EdgeInsets.all(AppSizes.ph8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(AppSizes.br12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSizes.ph10),
                        Center(child: UserGuideTitle(title: tr(AppStrings.howToRequestEasily))),
                        SizedBox(height: AppSizes.ph10),
                        UserGuideContent(
                          content: tr(AppStrings.toObtainBacuraTecServices),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.selectService),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.beginWithSelectService),
                        ),
                        UserGuideSmallList(
                          content: tr(AppStrings.systems),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.selectServiceType),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.afterSelectServiceType),
                        ),
                        UserGuideSmallList(
                          content: tr(AppStrings.servicesTypes),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.enterOrderDetails),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.fillOrderForm),
                        ),
                        UserGuideSmallList(
                          content: tr(AppStrings.orderDetailsTypes),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.sendOrderPhase),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.sendOrderPhaseContent),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.reviewQuoteAndPayment),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.reviewQuoteAndPaymentContent),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.implementService),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.implementServiceContent),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.monitorTheStatus),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.immerseYourself),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.benefitFromConsultations),
                        ),
                        UserGuideSmallTitle(
                          title: tr(AppStrings.followTheLatest),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.bacuraMakeItEase),
                        ),
                      ],
                    )),
                Divider(color: ColorManager.lightBlueColor, thickness: AppSizes.ph2),
                Container(
                    padding: EdgeInsets.all(AppSizes.ph8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(AppSizes.br12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.ph10),
                        UserGuideTitle(
                          title: tr(AppStrings.trackYourOrderStatusEasily),
                        ),
                        SizedBox(height: AppSizes.ph10),
                        UserGuideContent(
                          content: tr(AppStrings.trackYourOrderStatusEasilyContent),
                        ),
                      ],
                    )),
                Divider(
                  color: ColorManager.lightBlueColor,
                  thickness: AppSizes.ph2,
                ),
                Container(
                    padding: EdgeInsets.all(AppSizes.ph8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(AppSizes.br12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSizes.ph10),
                        Center(
                          child: UserGuideTitle(
                            title: tr(AppStrings.contactWithTechnicalSupport),
                          ),
                        ),
                        SizedBox(height: AppSizes.ph10),
                        UserGuideContent(
                          content: tr(AppStrings.contactWithTechnicalSupportContent),
                        ),
                        UserGuideSmallList(
                          content: tr(AppStrings.sendComplaints),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.sendComplaintsContent),
                        ),
                        UserGuideSmallList(
                          content: tr(AppStrings.instantChat),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.instantChatContent),
                        ),
                        UserGuideSmallList(
                          content: tr(AppStrings.phoneCall),
                        ),
                        UserGuideContent(
                          content: tr(AppStrings.phoneCallContent),
                        ),
                      ],
                    )),
                Divider(
                  color: ColorManager.lightBlueColor,
                  thickness: AppSizes.ph2,
                ),
                Container(
                    padding: EdgeInsets.all(AppSizes.ph8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(AppSizes.br12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.ph10),
                        UserGuideTitle(title: tr(AppStrings.manageYourProfile)),
                        SizedBox(height: AppSizes.ph10),
                        UserGuideContent(content: tr(AppStrings.manageYourProfileContent)),
                      ],
                    )),
                SizedBox(height: AppSizes.ph10),
              ],
            ),
          )),
    );
  }
}
