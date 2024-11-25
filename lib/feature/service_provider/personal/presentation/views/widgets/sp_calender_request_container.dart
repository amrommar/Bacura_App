import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/values_manager.dart';

class SpCalenderRequestContainer extends StatelessWidget {
  const SpCalenderRequestContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primaryBlueColor,
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      margin: EdgeInsets.only(right: 35.w, top: 12.h, left: 35.w, bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      height: 100.h,
      child: Column(
        children: [
          IntrinsicHeight(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: SvgPicture.asset('assets/images/cameraicon.svg', height: 28),
              ),
              VerticalDivider(color: ColorManager.lightBlueColor, thickness: 0.5),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('تركيب وبرمجة',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorManager.whiteColor)),
                  SizedBox(height: 3.h),
                  Text('08:00 - 09:30',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.whiteColor)),
                ],
              )
            ],
          )),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 20.w),
              Icon(Icons.location_on, color: ColorManager.lightBlueColor, size: 22),
              SizedBox(width: 5.h),
              Text('حي االنرجس',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.lightBlueColor)),
              SizedBox(width: 10.w),
            ],
          )
        ],
      ),
    );
  }
}
