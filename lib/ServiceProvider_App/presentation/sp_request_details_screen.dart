import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/values_manager.dart';

class Sp_RequestDetails_Screen extends StatefulWidget {
  @override
  State<Sp_RequestDetails_Screen> createState() => _Sp_RequestDetails_ScreenState();
}

class _Sp_RequestDetails_ScreenState extends State<Sp_RequestDetails_Screen> {
  List<String> details = [
    'كاميرا IP خارجية 8MP 80m - هيكفيجن',
    'حزمة عدد 2 كاميرا IP خارجية (دقة 8 ميجابكسل) مع الملحقات',
    // 'Package 2 outdoor IP cameras (8 megapixel resolution) with accessories',
  ];

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as RequestDetailsArguments;
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.request_details)),
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
                  SizedBox(height: 5.h),

                  /// Request Details section/////////////////////////////////////////////
                  ListView.builder(
                      shrinkWrap: true,
                      // Allows the ListView to take only the required space
                      physics: NeverScrollableScrollPhysics(),
                      // Disables scrolling for inner ListView
                      itemCount: details.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(top: 5.h),
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                color: ColorManager.lightBlueColor,
                                borderRadius: BorderRadius.circular(AppSize.s8),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorManager.midWhiteColor,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 3)),
                                ]),
                            child: Column(children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Image.asset('assets/images/camers_image.png'),
                                SizedBox(width: 10.w),
                                Expanded(
                                    child: Text(details[index],
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              color: ColorManager.darkBlueColor,
                                            )))
                              ]),
                            ]));
                      }),

                  SizedBox(height: 20.h),

                  /// Total Money section/////////////////////////////////////////////
                  Text('تركيب وبرمجة',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
                  Divider(),

                  ///  location section/////////////////////////////////////////////
                  Image.asset(
                    'assets/images/map.png',
                    height: 160,
                  ),

                  ///  Payment status section/////////////////////////////////////////////
                  Custom_Row_Icon_TwoText(
                      title: AppLocalizations.of(context)!.payment_status,
                      description: 'تم الدفع',
                      icon: Icons.check_circle,
                      iconColor: ColorManager.darkGreenColor),

                  ///  Warranty status section/////////////////////////////////////////////
                  Custom_Row_Icon_TwoText(
                      title: AppLocalizations.of(context)!.warranty_status,
                      description: 'ساري',
                      icon: Icons.verified_user,
                      iconColor: ColorManager.midBlueColor),
                  Divider(),
                  SizedBox(height: 50.h),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8))),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.requestImplementRoute);
                      },
                      child: Text('تم تجهيز المواد',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.whiteColor))),
                ]))));
  }
}

class Custom_Row_Icon_TwoText extends StatelessWidget {
  String title;
  String description;
  IconData? icon;
  Color iconColor;

  Custom_Row_Icon_TwoText({required this.title, required this.description, this.icon, this.iconColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: 40.h,
        child: Row(children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold)),
          Expanded(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Text(description,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primaryBlueColor))),
            Icon(icon, size: 20, color: iconColor)
          ]))
        ]));
  }
}
