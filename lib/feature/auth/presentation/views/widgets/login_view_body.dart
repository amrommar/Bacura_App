import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/bacura_logo_container.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/custom_phonefield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var mobileNumberController = TextEditingController();

  String? completePhoneNumber;

  @override
  void initState() {
    super.initState();
    // Reset completePhoneNumber when the screen is initialized
    completePhoneNumber = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // logo container
              const BacuraLogoContainer(),
              SizedBox(height: 50.h),
              // page title
              Text(
                AppLocalizations.of(context)!.login,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Divider(color: ColorManager.lightBlueColor),
              // form for Name And Mobile Number
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    // Mobile Number Field
                    CustomPhoneField(
                        fieldName: AppLocalizations.of(context)!.mobileNumber,
                        hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                        controller: mobileNumberController,
                        onChanged: (phone) {
                          setState(() {
                            completePhoneNumber = phone.completeNumber; // Update completePhoneNumber
                          });
                        })
                  ])),
              SizedBox(height: 20.h),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // Get the current value of the mobile number directly from the controller
                        String currentPhoneNumber = mobileNumberController.text;
                        // Validate the phone number
                        if (currentPhoneNumber.isEmpty || currentPhoneNumber.length < 9) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 1),
                              backgroundColor: ColorManager.midWhiteColor,
                              content: Text(
                                AppLocalizations.of(context)!.please_enter_valid_phone_number,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: ColorManager.darkRedColor,
                                    ),
                              )));
                        } else {
                          Navigator.pushNamed(context, Routes.verifyOTPRoute);
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: Theme.of(context).textTheme.titleMedium,
                      ))),

              SizedBox(height: 20.h)
            ])));
  }
}
