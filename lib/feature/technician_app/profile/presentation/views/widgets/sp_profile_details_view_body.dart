import 'package:bacura_app/core/utils/index.dart';

class SpProfileDetailsViewBody extends StatefulWidget {
  const SpProfileDetailsViewBody({super.key});

  @override
  State<SpProfileDetailsViewBody> createState() => _SpProfileDetailsViewBodyState();
}

class _SpProfileDetailsViewBodyState extends State<SpProfileDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      /// Avatar Section (profile image/ icons) ___________________________________________________________________
      const SpAvatarSection(),
      SizedBox(height: 100.h),

      /// Details Section (number / email / gender / city) ___________________________________________________________________
      CustomShadowContainer(
          childWidget: Column(children: [
        SpProfileRowDetails(
          icon: Icons.phone_outlined,
          text: AppLocalizations.of(context)!.mobileNumber,
          value: '966535685692+',
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        SpProfileRowDetails(
          icon: Icons.mail_outline_outlined,
          text: AppLocalizations.of(context)!.email,
          value: 'amr1522@gmail.com',
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        SpProfileRowDetails(
          icon: Icons.transgender_outlined,
          text: AppLocalizations.of(context)!.gender,
          value: 'ذكر',
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        SpProfileRowDetails(
          icon: Icons.location_on_outlined,
          text: AppLocalizations.of(context)!.city,
          value: 'الرياض',
        ),
      ])),

      /// Calender Section ___________________________________________________________________
      const RequestsCalenderContainer(),

      /// Completed Requests Section ___________________________________________________________________

      const CompletedRequestsContainer(),

      SizedBox(height: 35.h),

      ////         Logout Button      //////////////////////////////////////////////
      const LogoutButton(),
    ]));
  }
}
