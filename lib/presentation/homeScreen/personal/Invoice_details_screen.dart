import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Requests_tab/request_details_screen.dart';

class InvoiceDetails_Screen extends StatefulWidget {
  @override
  State<InvoiceDetails_Screen> createState() => _InvoiceDetails_ScreenState();
}

class _InvoiceDetails_ScreenState extends State<InvoiceDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.invoice)),
        body: Container(
            decoration: BoxDecoration(color: ColorManager.lightBlueColor, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: ListView(children: [
              ////  Request Number  section/////////////////////////////////////////////
              Text('#3333452',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              ////  Request Number and Time and Date section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ////Time and Date section/////////////////////////////////////////////
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.calendar_month_outlined, color: ColorManager.greyColor, size: 20),
                  SizedBox(width: 5.w),
                  Text('9/10/2024',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          ))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.access_time_outlined, color: ColorManager.greyColor, size: 20),
                  SizedBox(width: 2.w),
                  Text('10:35 ص',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primaryBlueColor))
                ])
              ]),
              Divider(color: ColorManager.whiteColor),
              Row(
                children: [
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.service_provider_name,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor)),
                  ),
                  Text('باكورة التقنيات',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
                ],
              ),
              Divider(color: ColorManager.whiteColor),
              Text(AppLocalizations.of(context)!.service_descript,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
              SizedBox(height: 10.h),
              Container(
                  color: ColorManager.lightBlueColor,
                  child: Column(children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Image.asset('assets/images/camers_image.png'),
                      SizedBox(width: 10.w),
                      Expanded(
                          child: Text('كاميرا IP خارجية 8MP 80m - كاميرا IP خارجية Hikvision 8MP 80m',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.greyColor)))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text('1000 ريال',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.darkRedColor))
                    ])
                  ])),
              SizedBox(height: 10.h),
              Container(
                  color: ColorManager.lightBlueColor,
                  child: Column(children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Image.asset('assets/images/camers_image.png'),
                      SizedBox(width: 10.w),
                      Expanded(
                          child: Text('كاميرا IP خارجية 8MP 80m - كاميرا IP خارجية Hikvision 8MP 80m',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.greyColor)))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text('1000 ريال',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.darkRedColor))
                    ])
                  ])),
              Divider(color: ColorManager.whiteColor),
              ////  money and payment method section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(AppLocalizations.of(context)!.total,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
                Text('2000',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold))
              ]),
              SizedBox(height: 20.h),

              ///  Location section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: AppLocalizations.of(context)!.location,
                description: ' الرياض حي العارض شارع أسماء بنت مالك',
                icon: Icons.location_on,
              ),

              ///  Payment Method section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: AppLocalizations.of(context)!.payment_method,
                description: 'بطاقة إئتمان',
                icon: Icons.monetization_on_outlined,
                iconColor: ColorManager.greyColor,
              ),

              ///  Payment status section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: AppLocalizations.of(context)!.payment_status,
                description: 'تم الدفع',
                icon: Icons.check_circle,
                iconColor: ColorManager.darkGreenColor,
              ),

              ///  Warranty status section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: AppLocalizations.of(context)!.warranty_status,
                description: 'ساري',
                icon: Icons.verified_user,
                iconColor: ColorManager.midBlueColor,
              ),
              SizedBox(height: 60.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(AppLocalizations.of(context)!.download_invoice,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor)),
                SizedBox(width: 10.w),
                Icon(Icons.download_outlined, color: ColorManager.darkBlueColor, size: 25),
              ])
            ])));
  }
}
