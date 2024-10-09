import 'package:bacura_app/presentation/getStarted/getstarted_screen.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:bacura_app/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_row_details.dart';

class PersonalDetails_Screen extends StatefulWidget {
  const PersonalDetails_Screen({super.key});

  @override
  State<PersonalDetails_Screen> createState() => _PersonalDetails_ScreenState();
}

class _PersonalDetails_ScreenState extends State<PersonalDetails_Screen> {
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
                    height: 80.h,
                    color: ColorManager.primaryBlueColor,
                  ),
                  // Profile image and edit icon
                  Positioned(
                    top: 20.h,
                    // Adjust this to make the profile picture half outside the blue container
                    left: 0.w,
                    right: 0.w,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // Profile picture
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  'assets/images/Ellipse 1.png'), // Replace with your image
                            ),
                            // Edit icon on top of the profile picture
                            Positioned(
                              bottom: 4.h,
                              right: 5.w,
                              child: CircleAvatar(
                                backgroundColor: ColorManager.primaryBlueColor,
                                radius: 12,
                                child: Icon(Icons.camera_alt_outlined,
                                    size: 15, color: ColorManager.whiteColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // User name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Mohamed Salah",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: ColorManager.darkBlueColor,
                                        fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Icon(Icons.drive_file_rename_outline,
                                color: ColorManager.primaryBlueColor, size: 25),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 110.h),

              /// Details Section (number / email / gender / city) ___________________________________________________________________
              Custom_Container(
                childWidget: Column(
                  children: [
                    CustomRow_Details(
                      icon: Icons.phone_outlined,
                      text: AppStrings.mobileNumber,
                      value: '+966535685692',
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                      child: Divider(
                        color: ColorManager.lightBlueColor,
                      ),
                    ),
                    CustomRow_Details(
                        icon: Icons.mail_outline_outlined,
                        text: AppStrings.email,
                        value: 'amr1522@gmail.com'),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                      child: Divider(
                        color: ColorManager.lightBlueColor,
                      ),
                    ),
                    CustomRow_Details(
                        icon: Icons.transgender_outlined,
                        text: AppStrings.gender,
                        value: 'Male'),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                      child: Divider(
                        color: ColorManager.lightBlueColor,
                      ),
                    ),
                    CustomRow_Details(
                        icon: Icons.location_on_outlined,
                        text: AppStrings.city,
                        value: 'Riyad'),
                  ],
                ),
              ),

              /// Wallet Section ___________________________________________________________________
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.walletDetailsRoute);
                },
                child: Custom_Container(
                  childWidget: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: ColorManager.greyColor,
                      ),
                      SizedBox(width: 10.w),
                      Text(AppStrings.walletManagement,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.darkBlueColor)),
                      Spacer(),
                      Text('1000 SR',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.primaryBlueColor)),
                      Icon(
                        Icons.navigate_next_rounded,
                        size: 28,
                        color: ColorManager.blackColor,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.h),

              /// Logout Button____________________________________________
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Getstarted_Screen()),
                        // New screen
                        ModalRoute.withName(Routes
                            .getStartedRoute), // Will remove all routes until this one
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.logout,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.login_outlined,
                          color: ColorManager.whiteColor,
                          size: 25,
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

// Container(
//   color: ColorManager.primaryBlueColor,
//   padding: EdgeInsets.all(16),
//   child: Column(
//     children: [
//       CircleAvatar(
//         radius: 50,
//         backgroundImage: AssetImage(
//             'assets/images/Ellipse 1.png'), // Replace with your image
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.drive_file_rename_outline,
//               color: Colors.white, size: 20),
//           SizedBox(width: 8),
//           Text(
//             "محمد صالح",
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
