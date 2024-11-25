import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/notifications/presentation/views/widgets/notification_content.dart';
import 'package:bacura_app/feature/notifications/presentation/views/widgets/notification_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(children: [
                const NotificationImage(),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: VerticalDivider(color: ColorManager.soLightGreyColor)),
                const NotificationContent()
              ]));
        },
        separatorBuilder: (context, index) => Container(width: 430.w, color: ColorManager.lightBlueColor, height: 1.h),
        itemCount: 15);
  }
}
