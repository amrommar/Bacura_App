import 'package:bacura_app/presentation/resources/DialogUtils.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/strings_manager.dart';
import '../../../../verifyOTP/textOTPfield.dart';

class Termsconditions_Bottomsheet extends StatefulWidget {
  @override
  State<Termsconditions_Bottomsheet> createState() =>
      _Termsconditions_BottomsheetState();
}

class _Termsconditions_BottomsheetState
    extends State<Termsconditions_Bottomsheet> {
  bool isChecked = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          ///Title of bottom sheet ////////////
          Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.oTPNumber,
                style: Theme.of(context).textTheme.displayLarge),
          ),
          Divider(color: ColorManager.primaryBlueColor),
          // OTP text Fields ____________________________
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Mobile Number Field_____________________________________
                    OTP_TextField(),
                    OTP_TextField(),
                    OTP_TextField(),
                    OTP_TextField(),
                  ],
                )),
          ),
          SizedBox(height: 20.h),
          ////Counter and Resend OTP Text //////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.sendOTPNumberAgain,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorManager.greyColor)),
              SizedBox(width: 10.w),
              Text(
                '60',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          SizedBox(height: 40.h),
          ////verify Elevated Button &  send OTP again//////////////////////////////////////////////////
          Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() == true) {
                        return DialogUtils.showMessage(
                            title: 'OTP',
                            context: context,
                            posActionName: 'Ok',
                            negActionName: 'Cancel',
                            posAction: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.homeScreenRoute,
                                  (Route<dynamic> route) => false);
                            },
                            message: 'Payment Done');
                      }
                    },
                    child: Text(AppStrings.check,
                        style: Theme.of(context).textTheme.titleMedium)),
                SizedBox(height: 20.h),
                Text(AppStrings.sendAgain,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
