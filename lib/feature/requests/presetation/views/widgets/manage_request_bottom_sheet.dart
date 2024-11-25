import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/manage_request_option_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageOnGoingRequestBottomSheet extends StatefulWidget {
  const ManageOnGoingRequestBottomSheet({super.key});

  @override
  State<ManageOnGoingRequestBottomSheet> createState() => _ManageOnGoingRequestBottomSheetState();
}

class _ManageOnGoingRequestBottomSheetState extends State<ManageOnGoingRequestBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              /// Cancel Request Button ////////////////////////////////////////
              ManageRequestOptionRow(
                  onTap: () {},
                  text: AppLocalizations.of(context)!.cancel_request,
                  icon: Icons.cancel,
                  iconColor: ColorManager.darkRedColor),
              const Divider(),

              /// Close the order Button ///////////////////////////////////////
              /// this is to make the order completed ////////////////////////////////
              ManageRequestOptionRow(
                onTap: () {},
                text: AppLocalizations.of(context)!.close_the_order,
                icon: Icons.lock,
                iconColor: ColorManager.primaryBlueColor,
              ),
              const Divider(),

              /// navigate PoP Button ///////////////////////////////////////
              Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_circle_down_outlined,
                        color: ColorManager.greyColor,
                        size: 30,
                      )))
            ])));
  }
}
