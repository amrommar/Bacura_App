import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class Custom_Container extends StatelessWidget {
  Widget childWidget;

  Custom_Container({required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        margin: EdgeInsets.all(AppMargin.m12),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3) // Offset in the x and y directions
              )
        ], borderRadius: BorderRadius.circular(AppSize.s12), color: ColorManager.whiteColor),
        child: childWidget);
  }
}
