import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/payment_screen.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/values_manager.dart';

class RequestImplement_Screen extends StatefulWidget {
  @override
  State<RequestImplement_Screen> createState() => _RequestImplement_ScreenState();
}

class _RequestImplement_ScreenState extends State<RequestImplement_Screen> {
  String buttonText = 'الوصول للعميل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تنفيذ الطلب')),
      body: Container(
          decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(AppSize.s12),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.midWhiteColor,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                )
              ]),
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          height: 800.h,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                ////  Request Number  section/////////////////////////////////////////////

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    'الطلب رقم: ',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                        ),
                  ),
                  Text(
                    '#3333452',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                ]),
                Divider(),
                ////Time and Date section/////////////////////////////////////////////
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.lightWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TimelineTile(
                        title: 'تم تجهيز المواد',
                        time: '12:05 ص',
                        isLast: false,
                        initialCompleted: true,
                        onToggle: (bool isCompleted) {
                          buttonText = 'الوصول للعميل';
                        },
                      ),
                      TimelineTile(
                        title: 'الوصول للعميل',
                        time: '2:05 م',
                        isLast: false,
                        initialCompleted: false,
                        onToggle: (bool isCompleted) {
                          buttonText = 'تم التنفيذ';
                          setState(() {});
                          isCompleted == true;
                        },
                      ),
                      TimelineTile(
                        title: 'تم التنفيذ',
                        time: '4:05 م',
                        isLast: true,
                        initialCompleted: false,
                        onToggle: (bool isCompleted) {
                          buttonText = 'إغلاق الطلب';
                          setState(() {});
                          isCompleted == true;
                        },
                      ),
                      SizedBox(height: 30.h),
                      Text('تركيب وبرمجة',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                /// Request Details section////////////////////////////////////////////
                buttonText == 'الوصول للعميل'
                    ? InkWell(
                        onTap: () => _makePhoneCall('0536885692'),
                        child: Custom_Payment_Container(
                          widget: Text('الاتصال بالعميل ',
                              style:
                                  Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
                          icon: Icons.call_outlined,
                        ),
                      )
                    : SizedBox(height: 50.h),
                SizedBox(height: 50.h),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8))),
                    onPressed: () {
                      if (buttonText == 'إغلاق الطلب') {
                        Navigator.pushNamed(context, Routes.spHomeScreenRoute);
                      }
                    },
                    child: Text(buttonText,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.whiteColor))),
              ]))),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

// Custom dashed line painter
class DashPainter extends CustomPainter {
  final double dashHeight;
  final double dashSpace;
  final Color color;

  DashPainter({this.dashHeight = 5, this.dashSpace = 5, this.color = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TimelineTile extends StatefulWidget {
  final Function(bool) onToggle;
  final String title;
  final String? time;
  final bool initialCompleted; // Initial state of completion
  final bool isLast;

  TimelineTile({
    required this.onToggle,
    required this.title,
    this.time,
    required this.initialCompleted,
    required this.isLast,
  });

  @override
  State<TimelineTile> createState() => _TimelineTileState();
}

class _TimelineTileState extends State<TimelineTile> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.initialCompleted; // Initialize the state based on initialCompleted
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              setState(() {
                isCompleted = !isCompleted; // Toggle the completion state
                widget.onToggle(isCompleted); // Call the callback with the new state
              });
            },
            child: Column(children: [
              Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted ? ColorManager.midBlueColor : ColorManager.lightGreyColor,
              ),
              if (!widget.isLast) ...[
                SizedBox(height: 4.0),
                // Dashed vertical line
                Container(
                    height: 40.0,
                    width: 2.0,
                    child: CustomPaint(
                        painter: DashPainter(
                      dashHeight: 4.0,
                      dashSpace: 4.0,
                      color: isCompleted ? ColorManager.primaryBlueColor : ColorManager.lightGreyColor,
                    )))
              ]
            ])),
        SizedBox(width: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: isCompleted ? ColorManager.primaryBlueColor : ColorManager.lightGreyColor,
                  ),
            ),
            SizedBox(width: 10.0),
            if (widget.time != null)
              Text(
                '(${widget.time!})',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isCompleted ? ColorManager.greyColor : ColorManager.lightWhiteColor,
                    ),
              ),
          ],
        ),
      ],
    );
  }
}
