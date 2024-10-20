import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Complaint_Screen extends StatefulWidget {
  @override
  State<Complaint_Screen> createState() => _Complaint_ScreenState();
}

class _Complaint_ScreenState extends State<Complaint_Screen> {
  var cameraTypeController = TextEditingController();
  var camerasNumberController = TextEditingController();
  var propertyTypeController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();

  final List<String> options = [
    'Service Provider',
    'Service Type',
    'Technician',
    'Customer Service'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaint Screen')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropDown_Field(
                  selectedOption: 'Service Provider',
                  options: options,
                  fieldName: 'Complaint Type',
                ),
                SizedBox(height: 20.h),
                question_TextFormField(
                  fieldName: 'Your Complaint',
                  hintText: 'Enter Your Complaint....',
                  controller: descriptionController,
                  maxLines: 7,
                ),
                SizedBox(height: 60.h),
                Center(
                  child: SmallElevatedbutton(
                    text: 'Send Complaint',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
