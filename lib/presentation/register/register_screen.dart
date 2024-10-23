import 'package:bacura_app/presentation/register/custom_phonefield.dart';
import 'package:bacura_app/presentation/register/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  String? completePhoneNumber;

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
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //logo container-----------------------
                Center(
                  child: Container(
                      width: 280.h,
                      child: SvgPicture.asset(ImageAssets.bacuraLogo)),
                ),
                SizedBox(height: 51.h),
                //page title____________________________
                Text(AppStrings.create_an_account,
                    style: Theme.of(context).textTheme.displayLarge),
                Divider(
                  color: ColorManager.lightBlueColor,
                ),
                //form for Name And Mobile Number ___________________________________
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: formKey, // <-- Added form key here
                      child: Column(
                        children: [
                          // Name Field ____________________________________________
                          Custom_TextFormField(
                            fieldName: AppStrings.userName,
                            controller: nameController,
                            hintText: AppStrings.enterYourName,
                            isObsucre: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppStrings.pleaseEnterYourName;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 10.h),
                          //Mobile Number Field_____________________________________
                          CustomPhone_Field(
                            fieldName: 'Mobile Number',
                            hintText: 'Enter your phone number',
                            controller: mobileNumberController,
                            onChanged: (phone) {
                              setState(() {
                                completePhoneNumber = phone.completeNumber;
                              });
                            },
                          ),
                        ],
                      )),
                ),
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
                              duration: Duration(seconds: 1),
                              backgroundColor: ColorManager.midWhiteColor,
                              content: Text(
                                'Please Enter Name & Mobile Number',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: ColorManager.darkRedColor),
                              )));
                        }
                      },
                      child: Text(AppStrings.register,
                          style: Theme.of(context).textTheme.titleMedium)),
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
