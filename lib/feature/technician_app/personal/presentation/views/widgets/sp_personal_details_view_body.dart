import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/completed_requests_container.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/custom_container.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/logout_button.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/requests_calender_container.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/sp_pesonal_row_details.dart';
import 'package:bacura_app/feature/technician_app/personal/presentation/views/widgets/sp_avatar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpPersonalDetailsViewBody extends StatefulWidget {
  const SpPersonalDetailsViewBody({super.key});

  @override
  State<SpPersonalDetailsViewBody> createState() => _SpPersonalDetailsViewBodyState();
}

class _SpPersonalDetailsViewBodyState extends State<SpPersonalDetailsViewBody> {
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
        SpPersonalRowDetails(
          icon: Icons.phone_outlined,
          text: AppLocalizations.of(context)!.mobileNumber,
          value: '966535685692+',
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        SpPersonalRowDetails(
          icon: Icons.mail_outline_outlined,
          text: AppLocalizations.of(context)!.email,
          value: 'amr1522@gmail.com',
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        SpPersonalRowDetails(
          icon: Icons.transgender_outlined,
          text: AppLocalizations.of(context)!.gender,
          value: 'ذكر',
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        SpPersonalRowDetails(
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
