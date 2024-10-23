import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';
import '../service_request/widgets/question_textformfield.dart';
import '../service_request/widgets/requestsent_bottomsheet.dart';
import '../service_request/widgets/small_elevatedbutton.dart';

class Consultation_Screen extends StatefulWidget {
  @override
  State<Consultation_Screen> createState() => _Consultation_ScreenState();
}

class _Consultation_ScreenState extends State<Consultation_Screen> {
  final List<String> options = ['Type 1', 'Type 2', 'Type 3'];
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultation Screen')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: ListView(
            children: [
              DropDown_Field(
                  selectedOption: 'Type 1',
                  options: options,
                  fieldName: 'Consultation Type'),
              question_TextFormField(
                  fieldName: 'Consultation Description',
                  hintText: 'Enter Consultation Description....',
                  controller: descriptionController,
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Consultation Description';
                    }
                    return null;
                  }),
              SizedBox(height: 10.h),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.whiteColor,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('*',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: ColorManager.greyColor)),
                        SizedBox(width: 10.w),
                        Expanded(
                            child: Text(
                                'Your consultation will be answered within three days.',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: ColorManager.greyColor)))
                      ])),
              SizedBox(height: 100.h),
              Center(
                  child: SmallElevatedbutton(
                      text: 'Send Request',
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          showRequestSentBottomSheet();
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestSent_BottomSheet();
        });
  }
}
