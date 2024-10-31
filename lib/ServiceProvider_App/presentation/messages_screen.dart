import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/resources/color_manager.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الرسائل')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(children: [
                  CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorManager.whiteColor,
                      ///////////////    from Back-End     /////////////////////
                      child: Image.asset('assets/images/Ellipse 1.png')),
                  Container(
                      width: 310.w,
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///////////////    from Back-End     /////////////////////
                            Text('محمد صلاح',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: ColorManager.darkBlueColor, fontSize: 18)),
                            Container(
                              width: 220.w,
                              child: Text('تفاصيل الرسالةتفاصيل الرسالةتفاصيل الرسالةتفاصيل الرسالةتفاصيل الرسالة',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: ColorManager.greyColor, fontSize: 12)),
                            )
                          ])),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: ColorManager.midBlueColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text('3',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.whiteColor)),
                    ),
                  )
                ]));
          },
          separatorBuilder: (context, index) =>
              Container(width: 430.w, color: ColorManager.lightBlueColor, height: 1.h),
          itemCount: 15),
    );
  }
}
