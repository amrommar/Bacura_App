import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Getstarted_Screen extends StatefulWidget {
  const Getstarted_Screen({super.key});

  @override
  State<Getstarted_Screen> createState() => _Getstarted_ScreenState();
}

class _Getstarted_ScreenState extends State<Getstarted_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        ImageAssets.background2Image,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  child: Text(AppStrings.ar,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryBlueColor)),
                  alignment: Alignment.topRight),
              SizedBox(height: 20.h),
              Container(
                  width: 280.h,
                  child: SvgPicture.asset(ImageAssets.bacuraLogo)),
              SizedBox(height: 95.h),
              Text(AppStrings.asfartWaAnwart,
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 10.h),
              Text(
                  AppStrings.you_can_browse_the_application_without_registering,
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 100.h),
              //As A Visitor button______________________________
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.lightBlueColor),
                  onPressed: () {},
                  child: Text(AppStrings.continue_as_a_visitor,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.primaryBlueColor))),
              SizedBox(height: 26.h),
              //Login button______________________________
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginRoute);
                  },
                  child: Text(AppStrings.login,
                      style: Theme.of(context).textTheme.titleMedium)),
              SizedBox(height: 18.h),
              //Register button______________________________
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                    child: Text(
                      AppStrings.create_an_account,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    AppStrings.dont_have_an_account,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.blackColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
