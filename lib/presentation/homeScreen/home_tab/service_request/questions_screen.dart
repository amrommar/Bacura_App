import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/set_date_screen.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';

class Questions_Screen extends StatefulWidget {
  const Questions_Screen({super.key});

  @override
  State<Questions_Screen> createState() => _Questions_ScreenState();
}

class _Questions_ScreenState extends State<Questions_Screen> {
  var cameraTypeController = TextEditingController();
  var camerasNumberController = TextEditingController();
  var propertyTypeController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technical Questions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              question_TextFormField(
                fieldName: 'Camera Type',
                hintText: 'Enter Camera Type',
                controller: cameraTypeController,
              ),
              question_TextFormField(
                fieldName: 'Cameras Number',
                hintText: 'Enter Cameras Number',
                controller: camerasNumberController,
              ),
              question_TextFormField(
                fieldName: 'Property Type',
                hintText: 'Enter Property Type',
                controller: propertyTypeController,
              ),
              question_TextFormField(
                fieldName: 'Location',
                hintText: 'Set Your Location',
                controller: locationController,
                suffixIcon: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.testRoute);
                  },
                  child: Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.midBlueColor,
                    size: 27,
                  ),
                ),
              ),
              question_TextFormField(
                fieldName: 'Service Description',
                hintText: 'Enter Service Description....',
                controller: descriptionController,
                maxLines: 4,
              ),
              SizedBox(height: 70.h),
              Custom_ElevatedButton(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class question_TextFormField extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObsucre;
  int maxLines;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  question_TextFormField({
    required this.fieldName,
    this.maxLines = 1,
    required this.hintText,
    this.suffixIcon,
    this.isObsucre = false,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManager.blackColor),
          ),
          TextFormField(
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManager.darkBlueColor),
            validator: validator,
            maxLines: maxLines,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isObsucre,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.lightGreyColor,
                      width: AppSize.s1,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s8)),
                contentPadding: EdgeInsets.only(left: 8, right: 8),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.greyColor)),
          )
        ],
      ),
    );
  }
}
