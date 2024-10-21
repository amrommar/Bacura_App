import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/values_manager.dart';

class Customdeposit_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.lightBlueColor,
        borderRadius: BorderRadius.circular(AppSize.s8),
        boxShadow: [
          BoxShadow(
              color: ColorManager.midWhiteColor,
              // Shadow color with opacity
              spreadRadius: 2,
              // Spread radius
              blurRadius: 4,
              // Blur radius
              offset: Offset(0, 3) // Offset in the x and y directions
              ),
        ],
      ),
      margin: EdgeInsets.only(
          right: AppMargin.m12, top: AppMargin.m12, left: AppMargin.m12),
      padding: EdgeInsets.all(AppPadding.p12),
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////  Request Number and Time and Date section/////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ////Time and Date section/////////////////////////////////////////////
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: ColorManager.darkBlueColor,
                    size: 20,
                  ),
                  SizedBox(width: 5.w),
                  Text('9/10/2024',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: ColorManager.darkBlueColor,
                    size: 20,
                  ),
                  SizedBox(width: 2.w),
                  Text('10:35 am',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          )),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1000 SR',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.primaryBlueColor,
                      fontWeight: FontWeight.bold)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text('Credit Card',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: ColorManager.primaryBlueColor,
                                )),
                  ),
                  Icon(
                    Icons.monetization_on_outlined,
                    color: ColorManager.darkBlueColor,
                    size: 20,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
