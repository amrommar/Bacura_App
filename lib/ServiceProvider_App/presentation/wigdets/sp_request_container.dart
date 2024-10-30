import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';

class SP_RequestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(
            AppSize.s8,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.soLightGreyColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // Offset in the x and y directions
            )
          ]),
      margin: EdgeInsets.only(right: 10.w, top: 24.h, left: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
      height: 160.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ////  Request Number  section/////////////////////////////////////////////

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'الطلب رقم: ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                  ),
            ),
            Text(
              '#3333452',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
            ),
          ]),
          ////service Time section/////////////////////////////////////////////

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150.w,
                child: Text('وقت التنفيذ: ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.blackColor,
                        )),
              ),
              ////Time and Date section/////////////////////////////////////////////
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.access_time_outlined,
                  color: ColorManager.primaryBlueColor,
                  size: 20,
                ),
                SizedBox(width: 5.w),
                Text('10:35 ص',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.greyColor,
                        )),
              ]),
            ],
          ),

          ////  Salary section/////////////////////////////////////////////
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.spRequestDetailsRoute);
            },
            child: Text('تفاصيل الطلب',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.whiteColor,
                    )),
          )
        ],
      ),
    );
  }
}
