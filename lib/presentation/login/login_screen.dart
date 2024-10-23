import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../register/custom_phonefield.dart';
import '../resources/strings_manager.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
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
          centerTitle: true,
          toolbarHeight: 100.h,
        ),
        backgroundColor: ColorManager.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // logo container
                Center(
                  child: Container(
                      width: 280.h,
                      child: SvgPicture.asset(ImageAssets.bacuraLogo)),
                ),
                SizedBox(height: 50.h),
                // page title
                Text(AppStrings.login,
                    style: Theme.of(context).textTheme.displayLarge),
                Divider(color: ColorManager.lightBlueColor),
                // form for Name And Mobile Number
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Mobile Number Field
                      CustomPhone_Field(
                        fieldName: 'Mobile Number',
                        hintText: 'Enter your phone number',
                        controller: mobileNumberController,
                        onChanged: (phone) {
                          setState(() {
                            completePhoneNumber = phone
                                .completeNumber; // Update completePhoneNumber
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Get the current value of the mobile number directly from the controller
                      String currentPhoneNumber = mobileNumberController.text;

                      // Validate the phone number
                      if (currentPhoneNumber.isEmpty ||
                          currentPhoneNumber.length < 9) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: ColorManager.midWhiteColor,
                          content: Text(
                            'Please enter a valid phone number',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ColorManager.darkRedColor),
                          ),
                        ));
                      } else {
                        Navigator.pushNamed(context, Routes.verifyOTPRoute);
                      }
                    },
                    child: Text(
                      AppStrings.login,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),

                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
