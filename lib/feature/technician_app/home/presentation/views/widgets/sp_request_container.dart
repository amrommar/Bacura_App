import 'package:bacura_app/feature/technician_app/home/presentation/views/widgets/sp_request_num_row.dart';
import 'package:bacura_app/feature/technician_app/home/presentation/views/widgets/sp_request_work_time_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/routes_manager.dart';
import '../../../../../../core/utils/values_manager.dart';

class SPRequestContainer extends StatelessWidget {
  const SPRequestContainer({super.key});

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
              offset: const Offset(0, 3), // Offset in the x and y directions
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

          const SpRequestNumRow(),
          ////service Time section/////////////////////////////////////////////

          const SpRequestWorkTimeRow(),

          //// request details button /////////////////////////////////////////////
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
