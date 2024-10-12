import 'package:bacura_app/presentation/verifyOTP/textOTPfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        ImageAssets.background2Image,
      ),
      Scaffold(
        //AppBar ________________________________________-
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
        resizeToAvoidBottomInset: false,
        body: Container(
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
              SizedBox(height: 50.h),
              //page title____________________________
              Text(AppStrings.oTPNumber,
                  style: Theme.of(context).textTheme.displayLarge),
              Divider(
                color: ColorManager.lightBlueColor,
              ),
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
                  Text(AppStrings.changeNumber,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: ColorManager.primaryBlueColor,
                              )),
                ],
              ),
              SizedBox(height: 30.h),
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
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.homeScreenRoute,
                            (Route<dynamic> route) => false,
                          );
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
        ),
      ),
    ]);
  }
}
