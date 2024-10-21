import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../homeScreen/Requests_tab/request_details_screen.dart';

class InvoiceDetails_Screen extends StatefulWidget {
  @override
  State<InvoiceDetails_Screen> createState() => _InvoiceDetails_ScreenState();
}

class _InvoiceDetails_ScreenState extends State<InvoiceDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: ColorManager.lightBlueColor,
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          child: ListView(
            children: [
              ////  Request Number  section/////////////////////////////////////////////
              Text('#3333452',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.primaryBlueColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              ////  Request Number and Time and Date section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ////Time and Date section/////////////////////////////////////////////
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.calendar_month_outlined,
                      color: ColorManager.greyColor, size: 20),
                  SizedBox(width: 5.w),
                  Text('9/10/2024',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          ))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.access_time_outlined,
                      color: ColorManager.greyColor, size: 20),
                  SizedBox(width: 2.w),
                  Text('10:35 am',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorManager.primaryBlueColor))
                ])
              ]),
              Divider(color: ColorManager.whiteColor),
              Row(
                children: [
                  Expanded(
                    child: Text('Service Provider Name: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorManager.primaryBlueColor)),
                  ),
                  Text('Bacura Tech',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.darkBlueColor)),
                ],
              ),
              Divider(color: ColorManager.whiteColor),
              Text('Service Description: ',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.darkBlueColor)),
              SizedBox(height: 10.h),
              Container(
                  color: ColorManager.lightBlueColor,
                  child: Column(children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/camers_image.png'),
                          SizedBox(width: 10.w),
                          Expanded(
                              child: Text(
                                  '8MP 80m outdoor IP camera - Hikvision 8MP 80m outdoor IP camera',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: ColorManager.greyColor)))
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text('1000 SR',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.darkRedColor))
                    ])
                  ])),
              SizedBox(height: 10.h),
              Container(
                  color: ColorManager.lightBlueColor,
                  child: Column(children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/camers_image.png'),
                          SizedBox(width: 10.w),
                          Expanded(
                              child: Text(
                                  '8MP 80m outdoor IP camera - Hikvision 8MP 80m outdoor IP camera',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: ColorManager.greyColor)))
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text('1000 SR',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.darkRedColor))
                    ])
                  ])),
              Divider(color: ColorManager.whiteColor),
              ////  money and payment method section/////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total:  ',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.primaryBlueColor,
                          fontWeight: FontWeight.bold)),
                  Text('2000',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.primaryBlueColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 20.h),

              ///  Location section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Location: ',
                description: 'Riyad Elared Asmaa bent malet ST',
                icon: Icons.location_on,
              ),

              ///  Payment Method section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Payment Method: ',
                description: 'Credit Card',
                icon: Icons.monetization_on_outlined,
                iconColor: ColorManager.greyColor,
              ),

              ///  Payment status section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Payment status: ',
                description: 'Payment made',
                icon: Icons.check_circle,
                iconColor: ColorManager.darkGreenColor,
              ),

              ///  Warranty status section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Warranty status: ',
                description: 'Valid',
                icon: Icons.verified_user,
                iconColor: ColorManager.midBlueColor,
              ),
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Download Invoice',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorManager.primaryBlueColor)),
                  SizedBox(width: 10.w),
                  Icon(Icons.download_outlined,
                      color: ColorManager.primaryBlueColor, size: 20),
                ],
              )
            ],
          )),
    );
  }
}
