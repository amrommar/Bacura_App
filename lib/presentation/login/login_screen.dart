import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/widgets/custom_phonefield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/strings_manager.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //logo container-----------------------
                Center(
                  child: Container(
                      width: 280.h,
                      child: SvgPicture.asset(ImageAssets.bacuraLogo)),
                ),
                SizedBox(height: 50.h),
                //page title____________________________
                Text(AppStrings.login,
                    style: Theme.of(context).textTheme.displayLarge),
                Divider(
                  color: ColorManager.darkBlueColor,
                  indent: 155.w,
                  thickness: 2,
                ),
                SizedBox(height: 10.h),

                //form for Name And Mobile Number ___________________________________
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          //Mobile Number Field_____________________________________
                          Custom_PhoneField(
                            hintText: AppStrings.enterYourMobileNumber,
                            controller: mobileNumberController,
                            fieldName: AppStrings.mobileNumber,
                            validator: (value) {
                              if (value == null) {
                                return AppStrings.pleaseEnterYourMobileNumber;
                              }
                              return null;
                            },
                          )
                        ],
                      )),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.verifyOTPRoute);
                      },
                      child: Text(AppStrings.login,
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
