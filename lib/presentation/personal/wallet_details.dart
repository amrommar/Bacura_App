import 'package:bacura_app/presentation/personal/widgets/custom_container.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/color_manager.dart';

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
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Avatar Section (profile image/ icons) ___________________________________________________________________
              Stack(
                  clipBehavior: Clip.none,
                  // This allows the profile image to overflow out of the container
                  children: [
                    // Blue background
                    Container(
                        height: 80.h, color: ColorManager.primaryBlueColor),
                    // Profile image ____________________________________________________
                    Positioned(
                        top: 20.h,
                        // Adjust this to make the profile picture half outside the blue container
                        left: 0.w,
                        right: 0.w,
                        child: Column(children: [
                          CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  'assets/images/Ellipse 1.png') // Replace with your image
                              ),
                          SizedBox(height: 8),
                          // User name
                          Text('Mohamed Salah',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: ColorManager.darkBlueColor,
                                      fontWeight: FontWeight.bold))
                        ]))
                  ]),
              SizedBox(height: 100.h),

              /// Container of Wallet Balance_______________________________
              Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Stack(alignment: Alignment.topRight, children: [
                    SvgPicture.asset('assets/images/walletCard_background.svg'),
                    Container(
                        margin: EdgeInsets.all(AppMargin.m20),
                        child: Column(children: [
                          Text(AppStrings.walletBalance,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorManager.lightGreyColor)),
                          SizedBox(height: 10.h),
                          Text('1000 SR',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorManager.whiteColor)),
                        ]))
                  ])),
              ////Row of three buttons ( add money / deposit / pay) _____________________________________
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //// add money click //////////////////////////////
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          /// function to go to add money to the Wallet ///////////////////////
                        },
                        child: Custom_Container(
                            childWidget: Icon(Icons.add_circle_outline_outlined,
                                size: 35,
                                color: ColorManager.primaryBlueColor)),
                      ),
                      Text(AppStrings.addMoney,
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                  ////  Deposit click to go to deposit last operations //////////////////////////////
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.lastOperationsRoute);
                          },
                          child: Custom_Container(
                              childWidget: Icon(
                                  Icons.arrow_circle_down_outlined,
                                  size: 35,
                                  color: ColorManager.primaryBlueColor))),
                      Text(AppStrings.deposit,
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                  ////  Payments click to go to Payments last operations //////////////////////////////
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.lastOperationsRoute);
                          },
                          child: Custom_Container(
                              childWidget: Icon(Icons.monetization_on_outlined,
                                  size: 35,
                                  color: ColorManager.primaryBlueColor))),
                      Text(AppStrings.payment,
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              //// last operations Section //////////////////////////////
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.lastOperations,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: ColorManager.darkBlueColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.lastOperationsRoute);
                          },
                          child: Text(
                            AppStrings.all,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
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
                                  AppStrings.wallet,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                Text(
                                  AppStrings.deposit,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: ColorManager.greyColor),
                                ),
                              ],
                            ),
                          ),
                          Text('1200 SR'),
                        ],
                      ),
                    ),
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
                                  'Bacura Company',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                Text(
                                  AppStrings.payment,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: ColorManager.greyColor),
                                ),
                              ],
                            ),
                          ),
                          Text('250 SR'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
