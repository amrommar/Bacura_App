import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceTypeContainer extends StatefulWidget {
  String text;

  ServiceTypeContainer({super.key, required this.text});

  @override
  State<ServiceTypeContainer> createState() => _ServiceTypeContainerState();
}

class _ServiceTypeContainerState extends State<ServiceTypeContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.lightBlueColor,
          // Shadow color with opacity
          spreadRadius: 2, // Spread radius
          blurRadius: 4, // Blur radius
          offset: const Offset(0, 3), // Offset in the x and y directions
        ),
      ], borderRadius: BorderRadius.circular(AppSize.s12), color: ColorManager.whiteColor),
      child: InkWell(
        onTap: () {
          if (isChecked == false) {
            isChecked = true;
          } else if (isChecked == true) {
            isChecked = false;
          }
          setState(() {});
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isChecked == false
                ? Icon(Icons.circle_outlined, color: ColorManager.blackColor)
                : Icon(Icons.circle, color: ColorManager.primaryBlueColor),
            Container(
                padding: EdgeInsets.only(top: 6.h, right: 8.w, left: 8.w),
                width: 345.w,
                child: Text(widget.text,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.blackColor)))
          ],
        ),
      ),
    );
  }
}
