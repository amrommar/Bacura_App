import 'package:bacura_app/presentation/homeScreen/Requests_tab/widgets/managerequest_bottom_sheet.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class Request_Details_Screen extends StatefulWidget {
  @override
  State<Request_Details_Screen> createState() => _Request_Details_ScreenState();
}

class _Request_Details_ScreenState extends State<Request_Details_Screen> {
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
                  ////  Request Number and Icons for Contact section/////////////////////////////////////////////
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('#3333452',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.darkBlueColor,
                              fontWeight: FontWeight.bold,
                            )),
                    Row(children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.customerServiceRoute);
                          },
                          child: SvgPicture.asset('assets/images/contact_icon.svg', height: 20.h)),
                      SizedBox(width: 10.w),
                      Icon(Icons.circle, color: ColorManager.greenColor, size: 15)
                    ])
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
                              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Text(
                                  '1000 ريال',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: ColorManager.darkRedColor),
                                )
                              ])
                            ]));
                      }),

                  /// Total Money section/////////////////////////////////////////////
                  Container(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                      height: 40.h,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(AppLocalizations.of(context)!.total,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorManager.darkBlueColor,
                                  fontWeight: FontWeight.bold,
                                )),
                        Text('2000 ريال',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorManager.primaryBlueColor,
                                ))
                      ])),
                  Divider(),

                  ///  location section/////////////////////////////////////////////
                  Custom_Row_Icon_TwoText(
                    title: AppLocalizations.of(context)!.location,
                    description: ' الرياض حي العارض شارع أسماء بنت مالك',
                    icon: Icons.location_on,
                  ),

                  /// Payment Method section/////////////////////////////////////////////
                  Custom_Row_Icon_TwoText(
                      title: AppLocalizations.of(context)!.payment_method,
                      description: 'بطاقة إئتمانية',
                      icon: Icons.credit_card,
                      iconColor: ColorManager.greyColor),

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
                  manageRequestButtons(ColorManager.redColor)
                ]))));
  }

  Widget manageRequestButtons(Color requestColor) {
    if (requestColor == ColorManager.yellowColor) {
      //////////           Request Management Elevated Button              //////////////////////////////////////////
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s30))),
              onPressed: () {
                showManageRequestBottomSheet();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.request_management,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold)),
                    Icon(Icons.arrow_circle_up_outlined, color: ColorManager.whiteColor)
                  ])));
    } else if (requestColor == ColorManager.redColor) {
      //////////           Request Cancelled icon and text             //////////////////////////////////////////
      return Column(children: [
        Text(AppLocalizations.of(context)!.request_cancelled,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManager.darkRedColor, fontWeight: FontWeight.w500)),
        SizedBox(height: 10.h),
        Icon(Icons.cancel, color: ColorManager.darkRedColor, size: 50)
      ]);
    } else if (requestColor == ColorManager.greenColor) {
      //////////          Completed Request button and text             //////////////////////////////////////////

      return Column(children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                maximumSize: Size(170, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s30))),
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.re_request,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold))),
        SizedBox(height: 20.h),
        InkWell(
            ///////////////////////////        to go to the receipt file        /////////////////////////////////////
            onTap: () async {
              final Uri url = Uri.parse('https://printo.in/designs/t/bill-receipt-a5-billbook');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Text(AppLocalizations.of(context)!.invoice,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.w500)))
      ]);
    }
    return Container();
  }

  void showManageRequestBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ManageRequest_Bottom_Sheet();
        });
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
