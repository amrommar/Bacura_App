import 'package:bacura_app/presentation/homeScreen/Requests_tab/managerequest_bottom_sheet.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/values_manager.dart';

class Request_Details_Screen extends StatefulWidget {
  @override
  State<Request_Details_Screen> createState() => _Request_Details_ScreenState();
}

class _Request_Details_ScreenState extends State<Request_Details_Screen> {
  List<String> details = [
    '8MP 80m outdoor IP camera - Hikvision',
    'Package 2 outdoor IP cameras (8 megapixel resolution) with accessories',
    // 'Package 2 outdoor IP cameras (8 megapixel resolution) with accessories',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: [
            BoxShadow(
              color: ColorManager.midWhiteColor,
              // Shadow color with opacity
              spreadRadius: 2,
              // Spread radius
              blurRadius: 4,
              // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
        ),
        margin: EdgeInsets.all(AppMargin.m12),
        padding: EdgeInsets.all(AppPadding.p12),
        height: 800.h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ////  Request Number and Icons for Contact section/////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#3333452',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/contact_icon.svg',
                        height: 20.h,
                      ),
                      // Icon(
                      //   Icons.call_outlined,
                      //   color: ColorManager.darkBlueColor,
                      //   size: 20,
                      // ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.circle,
                        color: ColorManager.greenColor,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              Divider(),
              ////Time and Date section/////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: ColorManager.primaryBlueColor,
                        size: 20,
                      ),
                      SizedBox(width: 5.w),
                      Text('9/10/2024',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorManager.greyColor,
                                  )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: ColorManager.primaryBlueColor,
                        size: 20,
                      ),
                      SizedBox(width: 2.w),
                      Text('10:35 am',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorManager.greyColor,
                                  )),
                    ],
                  ),
                ],
              ),

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
                    padding: EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightBlueColor,
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.midWhiteColor,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/camers_image.png',
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                details[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ColorManager.darkBlueColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('1000 SR'),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),

              /// Total Money section/////////////////////////////////////////////
              Container(
                padding: EdgeInsets.only(
                    left: AppPadding.p8,
                    right: AppPadding.p8,
                    top: AppPadding.p8),
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2000 SR',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.primaryBlueColor),
                    ),
                  ],
                ),
              ),
              Divider(),

              ///  location section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Location: ',
                description: 'Riyad Elared Asmaa bent malet ST',
                icon: Icons.location_on,
              ),

              ///  location section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Payment Method: ',
                description: 'Credit Card',
                icon: Icons.credit_card,
                iconColor: ColorManager.primaryBlueColor,
              ),

              ///  location section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Payment status: ',
                description: 'Payment made',
                icon: Icons.check_circle,
                iconColor: ColorManager.greenColor,
              ),

              ///  location section/////////////////////////////////////////////
              Custom_Row_Icon_TwoText(
                title: 'Warranty status: ',
                description: 'Valid',
                icon: Icons.verified_user,
                iconColor: ColorManager.primaryBlueColor,
              ),
              Divider(),

              /// Request Management Elevated Button//////////////////////////////////////////
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s30))),
                    onPressed: () {
                      showManageRequestBottomSheet();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Request Management',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: ColorManager.whiteColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_circle_up_outlined,
                            color: ColorManager.whiteColor)
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
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

  Custom_Row_Icon_TwoText(
      {required this.title,
      required this.description,
      this.icon,
      this.iconColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(AppSize.s8)),
      margin: EdgeInsets.only(top: AppMargin.m4),
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
      height: 40.h,
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    description,
                    // 'Riyad Elared Asmaa bent malet ST',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorManager.primaryBlueColor),
                  ),
                ),
                Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
