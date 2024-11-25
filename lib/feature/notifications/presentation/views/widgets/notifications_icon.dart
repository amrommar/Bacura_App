import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsIcon extends StatelessWidget {
  const NotificationsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.notifications, size: 30.h),
        onPressed: () {
          Navigator.pushNamed(context, Routes.notificationsRoute);
        });
  }
}
