import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/values_manager.dart';

class ServiceType_Screen extends StatefulWidget {
  @override
  State<ServiceType_Screen> createState() => _ServiceType_ScreenState();
}

class _ServiceType_ScreenState extends State<ServiceType_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Type'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Service image ////////////////////////////////////
            Image.asset('assets/images/Rectangle 78.png', height: 240.h),

            /// Available Services Section ////////////////////////////////////
            Padding(
                padding: EdgeInsets.only(right: 16.w, top: 16.h, left: 16.w),
                child: Text('Available Services',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.darkBlueColor,
                        fontWeight: FontWeight.bold))),
            Service_Type_Container(text: 'Consultation'),
            Service_Type_Container(text: 'Installation & programming'),
            Service_Type_Container(text: 'Supply'),
            Service_Type_Container(text: 'Maintenance'),
            SizedBox(height: 80.h),

            /// Next ElevatedButton Section ////////////////////////////////////
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(170.w, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8))),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.serviceDetailsRoute);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.whiteColor,
                                fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10.w),
                      Icon(Icons.arrow_circle_right_outlined,
                          color: ColorManager.whiteColor)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

/// container have circle icon and text ////////////////////////////////////

class Service_Type_Container extends StatelessWidget {
  String text;

  Service_Type_Container({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 4, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.whiteColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.circle_outlined, color: ColorManager.blackColor),
          Container(
              padding: EdgeInsets.only(top: 6.h, right: 8.w, left: 8.w),
              width: 345.w,
              child: Text(text,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorManager.blackColor)))
        ],
      ),
    );
  }
}
