import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/bacura_logo_container.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/custom_phonefield.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //logo container-----------------------
              const BacuraLogoContainer(),
              SizedBox(height: 50.h),
              //page title____________________________
              Text(
                AppLocalizations.of(context)!.create_an_account,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Divider(color: ColorManager.lightBlueColor),
              //form for Name And Mobile Number ___________________________________
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: formKey, // <-- Added form key here
                      child: Column(children: [
                        // Name Field ____________________________________________
                        CustomTextFormField(
                            fieldName: AppLocalizations.of(context)!.fullName,
                            controller: nameController,
                            hintText: AppLocalizations.of(context)!.enterYourName,
                            isObsucre: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterYourName;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text),
                        SizedBox(height: 10.h),
                        //Mobile Number Field_____________________________________
                        CustomPhoneField(
                            fieldName: AppLocalizations.of(context)!.mobileNumber,
                            hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                            controller: mobileNumberController,
                            onChanged: (phone) {
                              setState(() {
                                completePhoneNumber = phone.completeNumber;
                              });
                            })
                      ]))),
              SizedBox(height: 20.h),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // Validate the form before proceeding
                        if (formKey.currentState?.validate() == true &&
                            (completePhoneNumber != null &&
                                completePhoneNumber!.isNotEmpty &&
                                completePhoneNumber!.length > 8)) {
                          Navigator.pushNamed(context, Routes.verifyOTPRoute);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 1),
                              backgroundColor: ColorManager.midWhiteColor,
                              content: Text(
                                AppLocalizations.of(context)!.please_enter_name_and_mobile_number,
                                style:
                                    Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkRedColor),
                              )));
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.register,
                          style: Theme.of(context).textTheme.titleMedium))),
              SizedBox(height: 18.h),
            ])));
  }
}
