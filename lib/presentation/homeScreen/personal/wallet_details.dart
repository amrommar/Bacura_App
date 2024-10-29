import 'package:bacura_app/presentation/homeScreen/personal/widgets/custom_container.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/color_manager.dart';

class Wallet_Details extends StatefulWidget {
  const Wallet_Details({super.key});

  @override
  State<Wallet_Details> createState() => _Wallet_DetailsState();
}

class _Wallet_DetailsState extends State<Wallet_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(elevation: 0),
        body: SingleChildScrollView(
            child: Column(children: [
          /// Avatar Section (profile image/ icons) ___________________________________________________________________
          Stack(
              clipBehavior: Clip.none,
              // This allows the profile image to overflow out of the container
              children: [
                Container(height: 80.h, color: ColorManager.primaryBlueColor),
                // Profile image ____________________________________________________
                Positioned(
                    top: 20.h,
                    // Adjust this to make the profile picture half outside the blue container
                    left: 0.w,
                    right: 0.w,
                    child: Column(children: [
                      CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/images/Ellipse 1.png')),
                      SizedBox(height: 8.h),

                      //// User name ///////////////////////////////////

                      Text('محمد صلاح',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold))
                    ]))
              ]),
          SizedBox(height: 100.h),

          /// Container of Wallet Balance_______________________________

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Stack(alignment: Alignment.topRight, children: [
                ////  if the background image will or not //////////////////////////
                SvgPicture.asset('assets/images/walletCard_background.svg'),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(children: [
                      Text(
                        AppLocalizations.of(context)!.walletBalance,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorManager.lightGreyColor,
                            ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '1000 ريال',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorManager.whiteColor,
                            ),
                      ),
                    ]))
              ])),

          ////Row of three buttons ( add money / deposit / pay) _____________________________________

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //// add money click //////////////////////////////
            Column(children: [
              InkWell(
                onTap: () {
                  /// function to go to add money to the Wallet ///////////////////////
                  Navigator.pushNamed(context, Routes.rechargeBalanceRoute);
                },
                child: Custom_Container(
                    childWidget: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 35,
                  color: ColorManager.primaryBlueColor,
                )),
              ),
              Text(
                AppLocalizations.of(context)!.addMoney,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ]),
            ////  Deposit click to go to deposit last operations //////////////////////////////
            Column(children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.lastOperationsRoute);
                  },
                  child: Custom_Container(
                      childWidget:
                          Icon(Icons.arrow_circle_down_outlined, size: 35, color: ColorManager.primaryBlueColor))),
              Text(
                AppLocalizations.of(context)!.deposits,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ]),
            ////  Payments click to go to Payments last operations //////////////////////////////
            Column(children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.lastOperationsRoute);
                  },
                  child: Custom_Container(
                      childWidget: Icon(
                    Icons.monetization_on_outlined,
                    size: 35,
                    color: ColorManager.primaryBlueColor,
                  ))),
              Text(
                AppLocalizations.of(context)!.payment,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ])
          ]),
          SizedBox(height: 50.h),
          //// last operations Section //////////////////////////////
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    AppLocalizations.of(context)!.lastOperations,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.lastOperationsRoute);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.all,
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ]),
                Container(
                  margin: EdgeInsets.symmetric(vertical: AppMargin.m8),
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/Ellipse 1.png'),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.wallet,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              AppLocalizations.of(context)!.deposit,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
                            ),
                          ],
                        ),
                      ),
                      Text('1200 ريال'),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    height: 50.h,
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Image.asset('assets/images/Ellipse 1.png'),
                      SizedBox(width: 16.w),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text(
                              'شركة باكورة التقنيات',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(AppLocalizations.of(context)!.payment,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: ColorManager.greyColor,
                                    ))
                          ])),
                      Text('250 ريال'),
                    ]))
              ]))
        ])));
  }
}
