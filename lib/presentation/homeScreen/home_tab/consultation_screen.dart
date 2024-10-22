import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Consultation_Screen extends StatefulWidget {
  @override
  State<Consultation_Screen> createState() => _Consultation_ScreenState();
}

class _Consultation_ScreenState extends State<Consultation_Screen> {
  final List<String> options = ['Type 1', 'Type 2', 'Type 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultation Screen')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: ListView(
          children: [
            DropDown_Field(
                selectedOption: 'Type 1',
                options: options,
                fieldName: 'Consultation Type'),
          ],
        ),
      ),
    );
  }
}
