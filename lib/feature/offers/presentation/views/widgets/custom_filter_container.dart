import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';

class Selected_Filter_Container extends StatelessWidget {
  String text;

  Selected_Filter_Container({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightGreyColor, spreadRadius: 0, blurRadius: 1, offset: Offset(0, 1))
        ], color: ColorManager.primaryBlueColor, borderRadius: BorderRadius.circular(20)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(Icons.check_circle, size: 20, color: ColorManager.whiteColor),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child:
                  Text(text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.whiteColor)))
        ]));
  }
}

class UnSelected_Filter_Container extends StatelessWidget {
  String text;

  UnSelected_Filter_Container({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            border: Border.all(color: ColorManager.soLightGreyColor),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Text(text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.soLightGreyColor))));
  }
}

class Filter_Icon extends StatelessWidget {
  Function() onTap;

  Filter_Icon({required this.onTap});

  @override
  Widget build(BuildContext context) {
    /// filter icon //////

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightBlueColor, spreadRadius: 0, blurRadius: 1, offset: Offset(0, 1))
        ], color: ColorManager.primaryBlueColor, borderRadius: BorderRadius.circular(16)),
        child: InkWell(onTap: onTap, child: Icon(Icons.filter_list_outlined, color: ColorManager.whiteColor)));
  }
}
