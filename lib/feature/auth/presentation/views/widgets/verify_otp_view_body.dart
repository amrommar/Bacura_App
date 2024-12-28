import 'package:bacura_app/core/utils/DialogUtils.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/bacura_logo_container.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/change_number_row.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/pin_code_text_field.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/resend_otp_again.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/verify_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOTPViewBody extends StatefulWidget {
  const VerifyOTPViewBody({super.key});

  @override
  State<VerifyOTPViewBody> createState() => _VerifyOTPViewBodyState();
}

class _VerifyOTPViewBodyState extends State<VerifyOTPViewBody> {
  var formKey = GlobalKey<FormState>();

  String pinCode = "";

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: AppLocalizations.of(context)!.continue_to_pay,
        imagePath: 'assets/images/bad-feedback.png',
        content: Text('تم تسجيل الدخول بنجاح'),
        onCancel: () {
          Navigator.of(context).pop();
        },
        onOk: () {
          Navigator.pushNamed(context, Routes.homeScreenRoute);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const BacuraLogoContainer(),
          SizedBox(height: 50.h),
          Text(
            AppLocalizations.of(context)!.oTPNumber,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Divider(color: ColorManager.lightBlueColor),
          SizedBox(height: 10.h),
          Text(AppLocalizations.of(context)!.oTPNumberSent,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorManager.greyColor,
                  )),
          const ChangeNumberRow(),
          SizedBox(height: 30.h),
          // OTP text Fields ____________________________
          Form(
              key: formKey,
              child: CustomPinCodeTextField(onChanged: (value) {
                setState(() {
                  pinCode = value; // Store the entered PIN
                });
              })),

          SizedBox(height: 50.h),
          Center(
              child: Column(children: [
            VerifyButton(
              onPressed: () {
                validatePin();
              },
            ),
            SizedBox(height: 20.h),
            const ResendOtpAgain()
          ]))
        ]));
  }

  void validatePin() {
    // Check if the PIN meets the validation criteria
    if (pinCode.isEmpty) {
      // Show error message if the PIN is empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.please_enter_the_OTP),
        backgroundColor: Colors.red,
      ));
    } else if (pinCode.length != 4) {
      // Show error message if the PIN length is not 4
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.otp_must_be_four_digits),
        backgroundColor: Colors.red,
      ));
    } else {
      // Proceed with the validated PIN code
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!.otp_verified),
          backgroundColor: Colors.green,
        ),
      );
      // Here you can navigate or perform other actions after successful validation
      showCustomDialog(context);
      // Message to show on successful validation
    }
  }
}
