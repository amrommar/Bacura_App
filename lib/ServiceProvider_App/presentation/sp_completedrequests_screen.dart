import 'package:bacura_app/presentation/homeScreen/personal/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/resources/color_manager.dart';

class Sp_Completedrequests_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات المنجزة'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Custom_Container(
              childWidget: Column(
            children: [
              ////Time and Date section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  '#3333452',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                ),
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
                          ))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: ColorManager.primaryBlueColor,
                    size: 20,
                  ),
                  SizedBox(width: 2.w),
                  Text('10:35 ص',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.greyColor,
                          ))
                ])
              ]),
              Divider(),
              SizedBox(height: 10.h),

              Row(children: [
                Text('اسم العميل: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                        )),
                Text('محمد صلاح',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.primaryBlueColor,
                          fontWeight: FontWeight.bold,
                        ))
              ]),
            ],
          ));
        },
      ),
    );
  }
}
