import 'package:bacura_app/presentation/resources/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class VerifyOTP_Screen extends StatefulWidget {
  const VerifyOTP_Screen({super.key});

  @override
  State<VerifyOTP_Screen> createState() => _VerifyOTP_ScreenState();
}

class _VerifyOTP_ScreenState extends State<VerifyOTP_Screen> {
  var formKey = GlobalKey<FormState>();
  String pinCode = "";

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        ImageAssets.background2Image,
      ),
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: ColorManager.primaryBlueColor,
            size: 30,
          ),
          backgroundColor: ColorManager.transparent,
          elevation: 0,
          toolbarHeight: 100.h,
        ),
        backgroundColor: ColorManager.transparent,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 29.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 280.h,
                  child: SvgPicture.asset(ImageAssets.bacuraLogo),
                ),
              ),
              SizedBox(height: 50.h),
              Text(AppStrings.oTPNumber,
                  style: Theme.of(context).textTheme.displayLarge),
              Divider(color: ColorManager.lightBlueColor),
              SizedBox(height: 10.h),
              Text(AppStrings.OTPNumberSent,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.greyColor)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppStrings.number,
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppStrings.changeNumber,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: ColorManager.primaryBlueColor,
                                )),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              // OTP text Fields ____________________________
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PinCodeTextField(
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                            color: ColorManager.primaryBlueColor, fontSize: 28),
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      setState(() {
                        pinCode = value; // Store the entered PIN
                      });
                    },
                    enablePinAutofill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      inactiveColor: ColorManager.darkBlueColor,
                      activeColor: ColorManager.primaryBlueColor,
                      selectedColor: ColorManager.darkBlueColor,
                      errorBorderColor: ColorManager.redColor,
                      inActiveBoxShadow: [
                        BoxShadow(color: ColorManager.midWhiteColor),
                      ],
                      activeBoxShadow: [
                        BoxShadow(color: ColorManager.midWhiteColor),
                      ],
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
                      selectedFillColor: Colors.green,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
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
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Call the validation method
                        validatePin();
                      },
                      child: Text(AppStrings.check,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    SizedBox(height: 20.h),
                    Text(AppStrings.sendAgain,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  // Validation function for the PIN
  void validatePin() {
    // Check if the PIN meets the validation criteria
    if (pinCode.isEmpty) {
      // Show error message if the PIN is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter the OTP."),
          backgroundColor: Colors.red,
        ),
      );
    } else if (pinCode.length != 4) {
      // Show error message if the PIN length is not 4
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("OTP must be 4 digits."),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Proceed with the validated PIN code
      print("Valid OTP: $pinCode");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text("OTP Verified!"),
          backgroundColor: Colors.green,
        ),
      );
      // Here you can navigate or perform other actions after successful validation
      DialogUtils.showMessage(
          title: 'OTP',
          context: context,
          posActionName: 'Ok',
          negActionName: 'Cancel',
          posAction: () {
            Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreenRoute,
                (Route<dynamic> route) => false);
          },
          message:
              'OTP Confirmed!'); // Message to show on successful validation
    }
  }
}
