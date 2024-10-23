import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../register/custom_phonefield.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

class Suggestions_Screen extends StatefulWidget {
  const Suggestions_Screen({super.key});

  @override
  State<Suggestions_Screen> createState() => _Suggestions_ScreenState();
}

class _Suggestions_ScreenState extends State<Suggestions_Screen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var suggestionsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggetions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                question_TextFormField(
                  fieldName: ' Full Name',
                  hintText: 'Enter your Name',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.pleaseEnterYourName;
                    }
                    return null;
                  },
                ),
                question_TextFormField(
                  fieldName: ' E-mail',
                  hintText: 'Enter your Email',
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
                CustomPhone_Field(
                  fieldName: 'Mobile Number',
                  hintText: 'Enter your phone number',
                  controller: mobileNumberController,
                  onChanged: (phone) {
                    setState(() {
                      completePhoneNumber = phone.completeNumber;
                    });
                  },
                ),
                question_TextFormField(
                  fieldName: ' Your Suggestions',
                  hintText: 'Your Suggestions is important....',
                  controller: suggestionsController,
                  maxLines: 8,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your suggestions';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 70.h),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(170.w, 50.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s8))),
                    onPressed: () {
                      // Validate the form before proceeding
                      if (formKey.currentState?.validate() == true &&
                          (completePhoneNumber != null &&
                              completePhoneNumber!.isNotEmpty &&
                              completePhoneNumber!.length > 8)) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: ColorManager.midWhiteColor,
                            content: Text(
                              'Please Enter All Data',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: ColorManager.darkRedColor),
                            )));
                      }
                    },
                    child: Text(
                      'Send',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.whiteColor,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
