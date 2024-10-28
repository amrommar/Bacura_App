import 'package:bacura_app/presentation/resources/DialogUtils.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTP_Bottomsheet extends StatefulWidget {
  @override
  State<OTP_Bottomsheet> createState() => _OTP_BottomsheetState();
}

class _OTP_BottomsheetState extends State<OTP_Bottomsheet> {
  bool isChecked = false;

  var formKey = GlobalKey<FormState>();
  String pinCode = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: ColorManager.whiteColor, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ///Title of bottom sheet ////////////
          Text(AppLocalizations.of(context)!.oTPNumber, style: Theme.of(context).textTheme.displayLarge),
          Divider(color: ColorManager.primaryBlueColor),
          // OTP text Fields ____________________________
          Form(
              key: formKey,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: PinCodeTextField(
                      textStyle: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: ColorManager.primaryBlueColor, fontSize: 28),
                      appContext: context,
                      length: 4,
                      onChanged: (value) {
                        setState(() {
                          pinCode = value; // Store the entered PIN
                        });
                      },
                      enablePinAutofill: true,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          inactiveColor: ColorManager.darkBlueColor,
                          activeColor: ColorManager.primaryBlueColor,
                          selectedColor: ColorManager.darkBlueColor,
                          errorBorderColor: ColorManager.redColor,
                          inActiveBoxShadow: [BoxShadow(color: ColorManager.midWhiteColor)],
                          activeBoxShadow: [BoxShadow(color: ColorManager.midWhiteColor)],
                          borderWidth: 1.5,
                          activeBorderWidth: 1.5,
                          disabledBorderWidth: 1.5,
                          inactiveBorderWidth: 1.5,
                          errorBorderWidth: 1.5,
                          selectedBorderWidth: 2,
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: ColorManager.lightRedColor,
                          inactiveFillColor: Colors.yellow,
                          selectedFillColor: Colors.green),
                      keyboardType: TextInputType.number))),
          SizedBox(height: 10.h),
          ////Counter and Resend OTP Text //////////////////////////////////////////////////
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(AppLocalizations.of(context)!.sendOTPNumberAgain,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.greyColor)),
            SizedBox(width: 10.w),

            /// make it a counter to resend the code ////////////
            Text('60', style: Theme.of(context).textTheme.displayMedium)
          ]),
          SizedBox(height: 40.h),
          ////verify Elevated Button &  send OTP again//////////////////////////////////////////////////
          Center(
              child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate() == true) {
                    //////// make a  alert Dialog /////
                    return DialogUtils.showMessage(
                        title: 'OTP',
                        context: context,
                        posActionName: AppLocalizations.of(context)!.ok,
                        negActionName: AppLocalizations.of(context)!.cancel,
                        posAction: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.homeScreenRoute, (Route<dynamic> route) => false);
                        },
                        //// make a good design for this message /////
                        message: 'Payment Done');
                  }
                },
                child: Text(AppLocalizations.of(context)!.verify, style: Theme.of(context).textTheme.titleMedium)),
            SizedBox(height: 20.h),
            Text(AppLocalizations.of(context)!.sendOTPAgain, style: Theme.of(context).textTheme.bodyMedium)
          ]))
        ])));
  }
}
