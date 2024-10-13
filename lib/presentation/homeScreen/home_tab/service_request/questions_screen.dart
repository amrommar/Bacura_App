import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/set_date_screen.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
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

  String selectedOption = 'IP';
  final List<String> options = ['Analog', 'IP', 'Wireless'];

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
              DropDown_Field(
                selectedOption: 'IP',
                options: options,
                fieldName: 'Camera Type',
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
                    Navigator.pushNamed(context, Routes.setLocationRoute);
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
