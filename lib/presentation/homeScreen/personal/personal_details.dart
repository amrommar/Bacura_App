import 'package:bacura_app/presentation/getStarted/getstarted_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/homeScreen/personal/widgets/custom_container.dart';
import 'package:bacura_app/presentation/register/custom_phonefield.dart';
import 'package:bacura_app/presentation/register/custom_textformfield.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_tab/service_request/widgets/dropdown_field.dart';
import 'widgets/custom_row_details.dart';

class PersonalDetails_Screen extends StatefulWidget {
  const PersonalDetails_Screen({super.key});

  @override
  State<PersonalDetails_Screen> createState() => _PersonalDetails_ScreenState();
}

class _PersonalDetails_ScreenState extends State<PersonalDetails_Screen> {
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          /// Avatar Section (profile image/ icons) ___________________________________________________________________
          Stack(
              clipBehavior: Clip.none,
              // This allows the profile image to overflow out of the container
              children: [
                Container(height: 80.h, color: ColorManager.primaryBlueColor),
                Positioned(
                    top: 20.h,
                    left: 0.w,
                    right: 0.w,
                    child: Column(children: [
                      Stack(
                        children: [
                          // Profile picture
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/Ellipse 1.png')),
                          // Edit icon on top of the profile picture
                          Positioned(
                            ///////////////////////   want method to edit image /////////////////////////////////
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
                            Text(AppStrings.userName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: ColorManager.darkBlueColor,
                                        fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            //////////////////////// Want method to edit the Name /////////////////////
                            Icon(Icons.drive_file_rename_outline,
                                color: ColorManager.primaryBlueColor, size: 25),
                          ])
                    ]))
              ]),
          SizedBox(height: 110.h),

          /// Details Section (number / email / gender / city) ___________________________________________________________________
          Custom_Container(
              childWidget: Column(children: [
            CustomRow_Details(
              icon: Icons.phone_outlined,
              text: AppStrings.mobileNumber,
              value: '+966535685692',
              onTap: () {
                showEditDetailsBottomSheet(AppStrings.mobileNumber);
              },
            ),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                child: Divider(color: ColorManager.lightBlueColor)),
            CustomRow_Details(
                onTap: () {
                  showEditDetailsBottomSheet(AppStrings.email);
                },
                icon: Icons.mail_outline_outlined,
                text: AppStrings.email,
                value: 'amr1522@gmail.com'),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                child: Divider(color: ColorManager.lightBlueColor)),
            CustomRow_Details(
                onTap: () {
                  showEditDetailsBottomSheet(AppStrings.gender);
                },
                icon: Icons.transgender_outlined,
                text: AppStrings.gender,
                value: 'Male'),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                child: Divider(color: ColorManager.lightBlueColor)),
            CustomRow_Details(
                onTap: () {
                  showEditDetailsBottomSheet(AppStrings.city);
                },
                icon: Icons.location_on_outlined,
                text: AppStrings.city,
                value: 'Riyad'),
          ])),

          /// Wallet Section ___________________________________________________________________
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.walletDetailsRoute);
              },
              child: Custom_Container(
                  childWidget: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Icon(Icons.account_balance_wallet_outlined,
                        color: ColorManager.greyColor),
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
                    Icon(Icons.navigate_next_rounded,
                        size: 28, color: ColorManager.blackColor)
                  ]))),
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
                        ModalRoute.withName(Routes
                            .getStartedRoute)); // Will remove all routes until this one
                  },
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.logout,
                            style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(width: 10.w),
                        Icon(Icons.login_outlined,
                            color: ColorManager.whiteColor, size: 25)
                      ])))
        ])));
  }

  showEditDetailsBottomSheet(String text) {
    var mobileNumberController = TextEditingController();
// var cityController = TextEditingController();
// var genderController = TextEditingController();
    var emailController = TextEditingController();
    final List<String> genderOptions = ['Male', 'Female'];
    final List<String> cityOptions = ['Riyad', 'Jadah', 'Makka', 'Damam'];
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
        context: context,
        builder: (context) {
          if (text == AppStrings.mobileNumber) {
            /// mobile number edit //////////////////////
            return Container(
                height: 250.h,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      CustomPhone_Field(
                        fieldName: 'Mobile Number',
                        hintText: 'Enter your phone number',
                        controller: mobileNumberController,
                        onChanged: (phone) {
                          setState(() {
                            completePhoneNumber = phone
                                .completeNumber; // Update completePhoneNumber
                          });
                        },
                      ),
                      SizedBox(height: 20.h),
                      SmallElevatedbutton(
                        text: 'Save',
                        onPressed: () {
                          // Get the current value of the mobile number directly from the controller
                          String currentPhoneNumber =
                              mobileNumberController.text;

                          // Validate the phone number
                          if (currentPhoneNumber.isEmpty ||
                              currentPhoneNumber.length < 9) {
                            // Close the bottom sheet first
                            Navigator.pop(context);

                            // Then show the Snackbar
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              backgroundColor: ColorManager.midWhiteColor,
                              content: Text(
                                'Please enter a valid phone number',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: ColorManager.darkRedColor),
                              ),
                            ));
                          } else {
                            // If valid, proceed to the next screen or save the data
                            Navigator.pop(
                                context); // Close the bottom sheet before navigating
                            Navigator.pushNamed(context, Routes.verifyOTPRoute);
                          }
                        },
                      )
                    ]),
                  ),
                ));
          }

          /// email edit //////////////////////
          else if (text == AppStrings.email) {
            return Container(
              height: 250.h,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Custom_TextFormField(
                        fieldName: AppStrings.email,
                        hintText: AppStrings.email,
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter Email';
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'please enter valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SmallElevatedbutton(
                      text: 'Save',
                      onPressed: () {
                        if (formKey.currentState!.validate() == true) {
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }

          /// gender edit //////////////////////
          else if (text == AppStrings.gender) {
            return Container(
              height: 250.h,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DropDown_Field(
                      selectedOption: 'Male',
                      options: genderOptions,
                      fieldName: 'Gender',
                    ),
                    SizedBox(height: 20.h),
                    SmallElevatedbutton(
                        text: 'Save',
                        onPressed: () {
                          /////////////////////// Method to save changes //////////////////////
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            );
          }

          /// city edit //////////////////////
          else if (text == AppStrings.city) {
            return Container(
              height: 250.h,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DropDown_Field(
                      selectedOption: 'Riyad',
                      options: cityOptions,
                      fieldName: 'City',
                    ),
                    SizedBox(height: 20.h),
                    SmallElevatedbutton(
                        text: 'Save',
                        onPressed: () {
                          /////////////////////// Method to save changes //////////////////////
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            );
          }

          /// user name edit //////////////////////
          else if (text == AppStrings.userName) {
            return CustomPhone_Field(
              hintText: AppStrings.email,
              controller: emailController,
              fieldName: AppStrings.email,
              validator: (value) {
                if (value == null) {
                  return AppStrings.email;
                }
                return null;
              },
            );
          }
          return Container();
        });
  }
}
