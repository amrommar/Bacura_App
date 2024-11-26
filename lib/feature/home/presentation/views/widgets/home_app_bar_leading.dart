import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarLeading extends StatelessWidget {
  const HomeAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.personalDetailsRoute);
        },
        child: Row(children: [
          SizedBox(width: 8.w),
          Flexible(
              child: CircleAvatar(
                  radius: 23.w,
                  backgroundColor: ColorManager.whiteColor,
                  child: Image.asset(
                    'assets/images/Ellipse 1.png',
                  )))
        ]));
  }
}
