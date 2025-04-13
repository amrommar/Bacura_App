import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class TechnicalSupportScreen extends StatefulWidget {
  const TechnicalSupportScreen({super.key});

  @override
  State<TechnicalSupportScreen> createState() => _TechnicalSupportScreenState();
}

class _TechnicalSupportScreenState extends State<TechnicalSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<MyProfileProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            tr(AppStrings.technicalSupport),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: AppSizes.ph10),

          ///Frequently asked questions tab //////////////////////////////
          CustomSupportContainerWidget(
              widget: Image.asset(
                AppAssets.question,
                height: AppSizes.ph80,
              ),
              text: tr(AppStrings.FAQ),
              onTap: () {
                Navigator.pushNamed(context, Routes.frequentlyAskedQuestionsRoute);
              }),

          ///Complaints tab //////////////////////////////
          CustomSupportContainerWidget(
              widget: Image.asset(
                AppAssets.badFeedback,
                height: AppSizes.ph80,
              ),
              text: tr(AppStrings.complaints),
              onTap: () {
                profileProvider.token == null
                    ? customShowCustomDialog(
                        context: context,
                        title: tr(AppStrings.login),
                        imagePath: AppAssets.badFeedback,
                        content: tr(AppStrings.pleaseLoginFirst),
                        isOk: true,
                        isCancel: true,
                        onCancel: () {
                          Navigator.pop(context);
                        },
                        onOk: () {
                          Navigator.pushNamed(context, Routes.loginRoute);
                        },
                      )
                    : Navigator.pushNamed(context, Routes.complaintScreenRoute);
              }),

          ///User Guide tab //////////////////////////////
          CustomSupportContainerWidget(
              widget: Image.asset(
                AppAssets.userGuide,
                height: AppSizes.ph80,
              ),
              text: tr(AppStrings.userGuide),
              onTap: () {
                Navigator.pushNamed(context, Routes.userGuideRoute);
              }),
          SizedBox(height: AppSizes.ph70),
          const BacuraLogoWidget()
        ])));
  }
}
