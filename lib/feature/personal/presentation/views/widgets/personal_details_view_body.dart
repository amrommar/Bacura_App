import 'dart:io';

import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/custom_phonefield.dart';
import 'package:bacura_app/feature/auth/presentation/views/widgets/custom_textformfield.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/avatar_section.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/custom_container.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/logout_button.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/personal_row_details.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetailsViewBody extends StatefulWidget {
  const PersonalDetailsViewBody({super.key});

  @override
  State<PersonalDetailsViewBody> createState() => _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<PersonalDetailsViewBody> {
  String? completePhoneNumber;
  File? _selectedImage;
  String name = 'Amr Omar'; // State for the name
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameController = TextEditingController(); // Persist controller

  @override
  void initState() {
    super.initState();
    nameController.text = name; // Initialize controller with current name
  }

  @override
  void dispose() {
    nameController.dispose(); // Dispose controller when the widget is destroyed
    super.dispose();
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(AppLocalizations.of(context)!.take_picture),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text(AppLocalizations.of(context)!.choose_from_gallery),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      // Avatar Section
      AvatarSection(
        onEditImage: _pickImage,
        imageFile: _selectedImage,
        userName: name,
        onEditName: () {
          showEditDetailsBottomSheet(AppLocalizations.of(context)!.fullName);
        },
      ),
      // Details Section
      CustomShadowContainer(
          childWidget: Column(children: [
        PersonalRowDetails(
          icon: Icons.phone_outlined,
          text: AppLocalizations.of(context)!.mobileNumber,
          value: '+966535685692',
          onTap: () {
            showEditDetailsBottomSheet(AppLocalizations.of(context)!.mobileNumber);
          },
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        PersonalRowDetails(
          icon: Icons.mail_outline_outlined,
          text: AppLocalizations.of(context)!.email,
          value: 'amr1522@gmail.com',
          onTap: () {
            showEditDetailsBottomSheet(AppLocalizations.of(context)!.email);
          },
        ),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        PersonalRowDetails(
            onTap: () {
              showEditDetailsBottomSheet(AppLocalizations.of(context)!.gender);
            },
            icon: Icons.transgender_outlined,
            text: AppLocalizations.of(context)!.gender,
            value: 'ذكر'),
        Divider(color: ColorManager.lightBlueColor, height: 20),
        PersonalRowDetails(
            onTap: () {
              showEditDetailsBottomSheet(AppLocalizations.of(context)!.city);
            },
            icon: Icons.location_on_outlined,
            text: AppLocalizations.of(context)!.city,
            value: 'الرياض'),
      ])),

      SizedBox(height: 80.h),

      // Logout Button
      const LogoutButton(),
    ]));
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
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                        key: formKey,
                        child: Column(children: [
                          CustomPhoneField(
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
                          SmallElevatedButton(
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
                                      duration: const Duration(seconds: 2),
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
                        ]))),
              ),
            );
          }

          /// email edit //////////////////////
          else if (text == AppLocalizations.of(context)!.email) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Form(
                        key: formKey,
                        child: CustomTextFormField(
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
                      SmallElevatedButton(
                          text: AppLocalizations.of(context)!.save,
                          onPressed: () {
                            if (formKey.currentState!.validate() == true) {
                              Navigator.pop(context);
                            }
                          })
                    ])),
              ),
            );
          }

          /// gender edit //////////////////////
          else if (text == AppLocalizations.of(context)!.gender) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                    height: 250.h,
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      DropDown_Field(
                        selectedOption: 'ذكر',
                        options: genderOptions,
                        fieldName: AppLocalizations.of(context)!.gender,
                      ),
                      SizedBox(height: 20.h),
                      SmallElevatedButton(
                          text: AppLocalizations.of(context)!.save,
                          onPressed: () {
                            /////////////////////// Method to save changes //////////////////////
                            Navigator.pop(context);
                          })
                    ])),
              ),
            );
          }

          /// city edit //////////////////////
          else if (text == AppLocalizations.of(context)!.city) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                    height: 250.h,
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      DropDown_Field(
                        selectedOption: 'الرياض',
                        options: cityOptions,
                        fieldName: AppLocalizations.of(context)!.city,
                      ),
                      SizedBox(height: 20.h),
                      SmallElevatedButton(
                          text: AppLocalizations.of(context)!.save,
                          onPressed: () {
                            /////////////////////// Method to save changes //////////////////////
                            Navigator.pop(context);
                          })
                    ])),
              ),
            );
          }

          /// user name edit //////////////////////
          else if (text == AppLocalizations.of(context)!.fullName) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Ensures it takes minimum space
                      children: [
                        if (text == AppLocalizations.of(context)!.fullName) ...[
                          CustomTextFormField(
                            fieldName: AppLocalizations.of(context)!.fullName,
                            hintText: AppLocalizations.of(context)!.enterYourName,
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterYourName;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          SmallElevatedButton(
                            text: AppLocalizations.of(context)!.save,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  name = nameController.text; // Update name in state
                                });
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                        // Add other fields for mobile number, email, etc.
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
    // void showEditDetailsBottomSheet(String text) {
    //   final formKey = GlobalKey<FormState>();
    //
    //   showModalBottomSheet(
    //     isScrollControlled: true, // Allows the BottomSheet to expand with the keyboard
    //     context: context,
    //     builder: (context) {
    //       return Padding(
    //         padding: EdgeInsets.only(
    //           bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
    //         ),
    //         child: SingleChildScrollView(
    //           child: Container(
    //             padding: const EdgeInsets.all(20),
    //             child: Form(
    //               key: formKey,
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min, // Ensures it takes minimum space
    //                 children: [
    //                   if (text == AppLocalizations.of(context)!.fullName) ...[
    //                     CustomTextFormField(
    //                       fieldName: AppLocalizations.of(context)!.fullName,
    //                       hintText: AppLocalizations.of(context)!.enterYourName,
    //                       controller: nameController,
    //                       validator: (value) {
    //                         if (value == null || value.trim().isEmpty) {
    //                           return AppLocalizations.of(context)!.pleaseEnterYourName;
    //                         }
    //                         return null;
    //                       },
    //                     ),
    //                     SizedBox(height: 20.h),
    //                     SmallElevatedButton(
    //                       text: AppLocalizations.of(context)!.save,
    //                       onPressed: () {
    //                         if (formKey.currentState!.validate()) {
    //                           setState(() {
    //                             name = nameController.text; // Update name in state
    //                           });
    //                           Navigator.pop(context);
    //                         }
    //                       },
    //                     ),
    //                   ],
    //                   // Add other fields for mobile number, email, etc.
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }
  }

// /// Wallet Section ___________________________________________________________________
// InkWell(
//     onTap: () {
//       Navigator.pushNamed(context, Routes.walletDetailsRoute);
//     },
//     child: Custom_Container(
//         childWidget: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//       Icon(Icons.account_balance_wallet_outlined, color: ColorManager.greyColor),
//       SizedBox(width: 10.w),
//       Text(AppLocalizations.of(context)!.walletManagement,
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.darkBlueColor)),
//       const Spacer(),
//       Text('1000 ريال',
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primaryBlueColor)),
//       Icon(Icons.navigate_next_rounded, size: 28, color: ColorManager.blackColor)
//     ]))),
}
