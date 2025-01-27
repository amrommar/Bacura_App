import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpProfileDetailsScreen extends StatefulWidget {
  const SpProfileDetailsScreen({super.key});

  @override
  State<SpProfileDetailsScreen> createState() => _SpProfileDetailsScreenState();
}

class _SpProfileDetailsScreenState extends State<SpProfileDetailsScreen> {
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(elevation: 0),
        body: SingleChildScrollView(
            child: Column(children: [
          /// Avatar Section (profile image/ icons) ___________________________________________________________________
          const SpAvatarWidget(),
          SizedBox(height: AppSizes.ph100),

          /// Details Section (number / email / gender / city) ___________________________________________________________________
          CustomShadowWidget(
              childWidget: Column(children: [
            SpProfileRowDetails(
              icon: Icons.phone_outlined,
              text: AppLocalizations.of(context)!.mobileNumber,
              value: '966535685692+',
            ),
            Divider(color: ColorManager.lightBlueColor, height: AppSizes.ph20),
            SpProfileRowDetails(
              icon: Icons.mail_outline_outlined,
              text: AppLocalizations.of(context)!.email,
              value: 'amr1522@gmail.com',
            ),
            Divider(color: ColorManager.lightBlueColor, height: AppSizes.ph20),
            SpProfileRowDetails(
              icon: Icons.transgender_outlined,
              text: AppLocalizations.of(context)!.gender,
              value: 'ذكر',
            ),
            Divider(color: ColorManager.lightBlueColor, height: AppSizes.ph20),
            SpProfileRowDetails(
              icon: Icons.location_on_outlined,
              text: AppLocalizations.of(context)!.city,
              value: 'الرياض',
            ),
          ])),

          /// Calender Section ___________________________________________________________________
          const RequestsCalenderWidget(),

          /// Completed Requests Section ___________________________________________________________________

          const CompletedRequestsWidget(),

          SizedBox(height: AppSizes.ph35),

          ////         Logout Button      //////////////////////////////////////////////
          const CustomLogoutButton(),
        ])));
  }
}
