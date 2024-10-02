import 'package:bacura_app/presentation/resources/assets_manager.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/strings_manager.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //logo container-----------------------
            Center(
              child: Container(
                  width: 300.h,
                  child: SvgPicture.asset(ImageAssets.bacuraLogo)),
            ),
            SizedBox(height: 51.h),
            //page title____________________________
            Text(AppStrings.create_an_account,
                style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: 10.h),

            ElevatedButton(
                onPressed: () {},
                child: Text(AppStrings.login,
                    style: Theme.of(context).textTheme.titleMedium)),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
