import 'package:bacura_app/presentation/homeScreen/More_tab/suggestions/suggestions_phonefield.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggetions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              question_TextFormField(
                fieldName: ' Full Name',
                hintText: 'Enter your Name',
                controller: nameController,
              ),
              question_TextFormField(
                fieldName: ' E-mail',
                hintText: 'Enter your Email',
                controller: emailController,
              ),
              Suggestions_PhoneField(
                  fieldName: 'Mobile Number',
                  hintText: 'Enter Your Mobile number',
                  controller: mobileNumberController),
              question_TextFormField(
                fieldName: ' Your Suggestions',
                hintText: 'Your Suggestions is important....',
                controller: suggestionsController,
                maxLines: 8,
              ),
              SizedBox(height: 70.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(170.w, 50.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8))),
                  onPressed: () {},
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
    );
  }
}
