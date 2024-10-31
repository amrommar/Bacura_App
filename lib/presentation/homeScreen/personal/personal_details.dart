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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        appBar: AppBar(elevation: 0),
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
                      Stack(children: [
                        // Profile picture
                        CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/images/Ellipse 1.png')),
                        // Edit icon on top of the profile picture
                        Positioned(
                            ///////////////////////   want method to edit image /////////////////////////////////
                            bottom: 4.h,
                            right: 5.w,
                            child: CircleAvatar(
                              backgroundColor: ColorManager.primaryBlueColor,
                              radius: 12,
                              child: Icon(Icons.camera_alt_outlined, size: 15, color: ColorManager.whiteColor),
                            ))
                      ]),
                      SizedBox(height: 8),
                      // User name
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(AppStrings.userName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        //////////////////////// Want method to edit the Name /////////////////////
                        Icon(Icons.drive_file_rename_outline, color: ColorManager.primaryBlueColor, size: 25),
                      ])
                    ]))
              ]),
          SizedBox(height: 110.h),

          /// Details Section (number / email / gender / city) ___________________________________________________________________
          Custom_Container(
              childWidget: Column(children: [
            CustomRow_Details(
              icon: Icons.phone_outlined,
              text: AppLocalizations.of(context)!.mobileNumber,
              value: '+966535685692',
              onTap: () {
                showEditDetailsBottomSheet(AppLocalizations.of(context)!.mobileNumber);
              },
            ),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                child: Divider(color: ColorManager.lightBlueColor)),
            CustomRow_Details(
              icon: Icons.mail_outline_outlined,
              text: AppLocalizations.of(context)!.email,
              value: 'amr1522@gmail.com',
              onTap: () {
                showEditDetailsBottomSheet(AppLocalizations.of(context)!.email);
              },
            ),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                child: Divider(color: ColorManager.lightBlueColor)),
            CustomRow_Details(
                onTap: () {
                  showEditDetailsBottomSheet(AppLocalizations.of(context)!.gender);
                },
                icon: Icons.transgender_outlined,
                text: AppLocalizations.of(context)!.gender,
                value: 'ذكر'),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 2),
                child: Divider(color: ColorManager.lightBlueColor)),
            CustomRow_Details(
                onTap: () {
                  showEditDetailsBottomSheet(AppLocalizations.of(context)!.city);
                },
                icon: Icons.location_on_outlined,
                text: AppLocalizations.of(context)!.city,
                value: 'الرياض'),
          ])),

          /// Wallet Section ___________________________________________________________________
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.walletDetailsRoute);
              },
              child: Custom_Container(
                  childWidget: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.account_balance_wallet_outlined, color: ColorManager.greyColor),
                SizedBox(width: 10.w),
                Text(AppLocalizations.of(context)!.walletManagement,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.darkBlueColor)),
                Spacer(),
                Text('1000 ريال',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primaryBlueColor)),
                Icon(Icons.navigate_next_rounded, size: 28, color: ColorManager.blackColor)
              ]))),
          SizedBox(height: 60.h),

          /// Logout Button____________________________________________
          Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Getstarted_Screen()),
                        ModalRoute.withName(Routes.getStartedRoute)); // Will remove all routes until this one
                  },
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.logout, style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(width: 10.w),
                        Icon(Icons.login_outlined, color: ColorManager.whiteColor, size: 25)
                      ])))
        ])));
  }

  showEditDetailsBottomSheet(String text) {
    var mobileNumberController = TextEditingController();
// var cityController = TextEditingController();
// var genderController = TextEditingController();
    var emailController = TextEditingController();
    final List<String> genderOptions = ['ذكر', 'أنثي'];
    final List<String> cityOptions = ['الرياض', 'جده', 'مكة', 'الدمام'];
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
        context: context,
        builder: (context) {
          if (text == AppLocalizations.of(context)!.mobileNumber) {
            /// mobile number edit //////////////////////
            return Container(
                height: 250.h,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(children: [
                          CustomPhone_Field(
                            fieldName: AppLocalizations.of(context)!.mobileNumber,
                            hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                            controller: mobileNumberController,
                            onChanged: (phone) {
                              setState(() {
                                completePhoneNumber = phone.completeNumber; // Update completePhoneNumber
                              });
                            },
                          ),
                          SizedBox(height: 20.h),
                          SmallElevatedbutton(
                              text: AppLocalizations.of(context)!.save,
                              onPressed: () {
                                // Get the current value of the mobile number directly from the controller
                                String currentPhoneNumber = mobileNumberController.text;

                                // Validate the phone number
                                if (currentPhoneNumber.isEmpty || currentPhoneNumber.length < 9) {
                                  // Close the bottom sheet first
                                  Navigator.pop(context);

                                  // Then show the Snackbar
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      duration: Duration(seconds: 2),
                                      backgroundColor: ColorManager.midWhiteColor,
                                      content: Text(
                                        AppLocalizations.of(context)!.please_enter_valid_phone_number,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: ColorManager.darkRedColor),
                                      )));
                                } else {
                                  // If valid, proceed to the next screen or save the data
                                  Navigator.pop(context); // Close the bottom sheet before navigating
                                  Navigator.pushNamed(context, Routes.verifyOTPRoute);
                                }
                              })
                        ]))));
          }

          /// email edit //////////////////////
          else if (text == AppLocalizations.of(context)!.email) {
            return Container(
                height: 250.h,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Form(
                    key: formKey,
                    child: Custom_TextFormField(
                      fieldName: AppLocalizations.of(context)!.email,
                      hintText: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return AppLocalizations.of(context)!.enter_your_email;
                        }
                        final bool emailValid =
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text);
                        if (!emailValid) {
                          return AppLocalizations.of(context)!.please_enter_valid_email;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SmallElevatedbutton(
                      text: AppLocalizations.of(context)!.save,
                      onPressed: () {
                        if (formKey.currentState!.validate() == true) {
                          Navigator.pop(context);
                        }
                      })
                ])));
          }

          /// gender edit //////////////////////
          else if (text == AppLocalizations.of(context)!.gender) {
            return Container(
                height: 250.h,
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  DropDown_Field(
                    selectedOption: 'ذكر',
                    options: genderOptions,
                    fieldName: AppLocalizations.of(context)!.gender,
                  ),
                  SizedBox(height: 20.h),
                  SmallElevatedbutton(
                      text: AppLocalizations.of(context)!.save,
                      onPressed: () {
                        /////////////////////// Method to save changes //////////////////////
                        Navigator.pop(context);
                      })
                ]));
          }

          /// city edit //////////////////////
          else if (text == AppLocalizations.of(context)!.city) {
            return Container(
                height: 250.h,
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  DropDown_Field(
                    selectedOption: 'الرياض',
                    options: cityOptions,
                    fieldName: AppLocalizations.of(context)!.city,
                  ),
                  SizedBox(height: 20.h),
                  SmallElevatedbutton(
                      text: AppLocalizations.of(context)!.save,
                      onPressed: () {
                        /////////////////////// Method to save changes //////////////////////
                        Navigator.pop(context);
                      })
                ]));
          }

          /// user name edit //////////////////////
          else if (text == AppLocalizations.of(context)!.fullName) {
            return CustomPhone_Field(
                hintText: AppLocalizations.of(context)!.enterYourName,
                controller: emailController,
                fieldName: AppLocalizations.of(context)!.fullName,
                validator: (value) {
                  if (value == null) {
                    return AppLocalizations.of(context)!.pleaseEnterYourName;
                  }
                  return null;
                });
          }
          return Container();
        });
  }
}
