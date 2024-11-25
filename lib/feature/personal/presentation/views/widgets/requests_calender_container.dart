import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsCalenderContainer extends StatelessWidget {
  const RequestsCalenderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.calenderRoute);
        },
        child: CustomShadowContainer(
            childWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: ColorManager.midBlueColor,
                ),
                SizedBox(width: 10.w),
                Text('التقويم',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                        ))
              ]),
              SizedBox(width: 10.w),
              Icon(
                Icons.navigate_next_rounded,
                size: 28,
                color: ColorManager.darkBlueColor,
              )
            ])));
  }
}
