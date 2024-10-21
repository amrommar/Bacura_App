import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class CustomPaymentOperation_Container extends StatefulWidget {
  @override
  State<CustomPaymentOperation_Container> createState() =>
      _CustomPaymentOperation_ContainerState();
}

class _CustomPaymentOperation_ContainerState
    extends State<CustomPaymentOperation_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.midBlueColor,
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
      height: 170.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////  Request Number and Time and Date section/////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ////  Request Number  section/////////////////////////////////////////////
              Text(
                '#3333452',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              ////Time and Date section/////////////////////////////////////////////
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: ColorManager.lightBlueColor,
                        size: 20,
                      ),
                      SizedBox(width: 5.w),
                      Text('9/10/2024',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorManager.whiteColor,
                                  )),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: ColorManager.lightBlueColor,
                        size: 20,
                      ),
                      SizedBox(width: 2.w),
                      Text('10:35 am',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorManager.whiteColor,
                                  )),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          ////service type section/////////////////////////////////////////////
          Container(
            width: 400.w,
            child: Text(
                '8MP 80m outdoor IP camera - Hikvision 8MP 80m outdoor IP camera - Hikvision ',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.lightBlueColor,
                    )),
          ),
          SizedBox(height: 10.h),
          ////  money and payment method section/////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1000 SR',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.whiteColor,
                      fontWeight: FontWeight.bold)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text('Credit Card',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: ColorManager.whiteColor,
                                )),
                  ),
                  Icon(
                    Icons.monetization_on_outlined,
                    color: ColorManager.lightBlueColor,
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
