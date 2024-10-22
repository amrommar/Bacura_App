import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications_Screen extends StatefulWidget {
  @override
  State<Notifications_Screen> createState() => _Notifications_ScreenState();
}

class _Notifications_ScreenState extends State<Notifications_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                height: 80.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: ColorManager.midWhiteColor,
                                // Shadow color with opacity
                                spreadRadius: 2,
                                // Spread radius
                                blurRadius: 4,

                                // Blur radius
                                offset: Offset(
                                    0, 3) // Offset in the x and y directions
                                )
                          ]),
                      child: CircleAvatar(
                          radius: 30.w,
                          backgroundColor: ColorManager.whiteColor,
                          child: Image.asset(
                              'assets/images/bakura (1) 1.png') // Adjust the radius to make sure it fits
                          )),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: VerticalDivider(
                          color: ColorManager.soLightGreyColor)),
                  Container(
                      width: 320.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Notification Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: ColorManager.darkBlueColor),
                            ),
                            Text(
                                'Notification Description Description Description Description Description Description Description',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: ColorManager.greyColor))
                          ]))
                ]));
          },
          separatorBuilder: (context, index) => Container(
              width: 430.w, color: ColorManager.lightBlueColor, height: 1.h),
          itemCount: 15),
    );
  }
}
