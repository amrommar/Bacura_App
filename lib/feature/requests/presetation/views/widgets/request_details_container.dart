import 'package:bacura_app/feature/requests/presetation/views/widgets/request_num_contact_icon_row.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_price.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_time_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class RequestDetailsContainer extends StatelessWidget {
  Color backgroundColor;

  Color requestColor;

  RequestDetailsContainer({super.key, required this.backgroundColor, required this.requestColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.midWhiteColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // Offset in the x and y directions
            )
          ]),
      margin: EdgeInsets.only(right: 18.w, top: 18.h, left: 18.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      height: 180.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////  Request Number and Icons for Contact section/////////////////////////////////////////////

          RequestNumContactIconRow(requestColor: requestColor),
          ////service type section/////////////////////////////////////////////

          SizedBox(
            width: 400.w,
            child: Text('كاميرا IP خارجية 8MP 80m - هيكفيجن Hikvision',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.blackColor,
                    )),
          ),
          ////Time and Date section/////////////////////////////////////////////

          const RequestTimeDate(),
          ////  Salary section/////////////////////////////////////////////
          const RequestPrice()
        ],
      ),
    );
  }
}
