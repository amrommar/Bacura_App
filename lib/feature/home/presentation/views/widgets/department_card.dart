import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepartmentCard extends StatelessWidget {
  String imagePath;
  String departmentTitle;

  DepartmentCard({required this.imagePath, required this.departmentTitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Card(
          color: ColorManager.lightBlueColor,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 100.h,
              width: 100.w,
              child: SvgPicture.asset(imagePath))),
      SizedBox(
          width: 100.w,
          child: Text(
            departmentTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor,
                ),
          ))
    ]);
  }
}
