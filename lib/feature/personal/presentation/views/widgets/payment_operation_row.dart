import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOperationRow extends StatelessWidget {
  const PaymentOperationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ////  Request Number  section/////////////////////////////////////////////
      Text('#3333452',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold)),
      ////Time and Date section/////////////////////////////////////////////
      Row(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.calendar_month_outlined, color: ColorManager.lightBlueColor, size: 20),
          SizedBox(width: 5.w),
          Text('9/10/2024', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.whiteColor))
        ]),
        SizedBox(width: 10.w),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.access_time_outlined, color: ColorManager.lightBlueColor, size: 20),
          SizedBox(width: 2.w),
          Text('10:35 ص', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.whiteColor))
        ])
      ])
    ]);
  }
}
