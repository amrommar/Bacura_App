import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class Custom_Request_Container extends StatelessWidget {
  Color backgroundColor;

  Color requestColor;

  Custom_Request_Container(
      {required this.backgroundColor, required this.requestColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.midWhiteColor,
            // Shadow color with opacity
            spreadRadius: 2,
            // Spread radius
            blurRadius: 4,
            // Blur radius
            offset: Offset(0, 3), // Offset in the x and y directions
          ),
        ],
      ),
      margin: EdgeInsets.only(
          right: AppMargin.m18, top: AppMargin.m18, left: AppMargin.m18),
      padding: EdgeInsets.all(AppPadding.p12),
      height: 180.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////  Request Number and Icons for Contact section/////////////////////////////////////////////

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#3333452',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/contact_icon.svg',
                    height: 20.h,
                  ),
                  // Icon(
                  //   Icons.call_outlined,
                  //   color: ColorManager.darkBlueColor,
                  //   size: 20,
                  // ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.circle,
                    color: requestColor,
                    size: 15,
                  )
                ],
              )
            ],
          ),
          ////service type section/////////////////////////////////////////////

          Container(
            width: 400.w,
            child: Text('8MP 80m outdoor IP camera - Hikvision ggggggg',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.blackColor,
                    )),
          ),
          ////Time and Date section/////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: ColorManager.primaryBlueColor,
                    size: 20,
                  ),
                  SizedBox(width: 5.w),
                  Text('9/10/2024',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.greyColor,
                          )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: ColorManager.primaryBlueColor,
                    size: 20,
                  ),
                  SizedBox(width: 2.w),
                  Text('10:35 am',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.greyColor,
                          )),
                ],
              ),
            ],
          ),
          ////  Salary section/////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('1000 SR',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.darkBlueColor,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
