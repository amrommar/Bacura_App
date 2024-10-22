import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/requestsent_bottomsheet.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ServiceDetails_Screen extends StatefulWidget {
  @override
  State<ServiceDetails_Screen> createState() => _ServiceDetails_ScreenState();
}

class _ServiceDetails_ScreenState extends State<ServiceDetails_Screen> {
  var cameraTypeController = TextEditingController();
  var camerasNumberController = TextEditingController();
  var propertyTypeController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();

  String selectedOption = '9 AM - 1 PM';
  final List<String> options = ['9 AM - 1 PM', '1 PM - 6 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Service Details')),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
            child: SingleChildScrollView(
                child: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  Text('Set The Date',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.blackColor)),
                  DateTimePicker(
                      autovalidate: true,
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime.now(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.darkBlueColor),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month_outlined,
                              color: ColorManager.midBlueColor),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorManager.lightGreyColor,
                                  width: AppSize.s1),
                              borderRadius: BorderRadius.circular(AppSize.s8)),
                          contentPadding:
                              EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h)),
                      lastDate: DateTime(2050),
                      onChanged: (val) => print(val),
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(val)),
                  DropDown_Field(
                      selectedOption: '9 AM - 1 PM',
                      options: options,
                      fieldName: 'Time to coordinate work'),
                  question_TextFormField(
                      fieldName: 'Location',
                      hintText: 'Set Your Location',
                      controller: locationController,
                      suffixIcon: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.setLocationRoute);
                          },
                          child: Icon(Icons.location_on_outlined,
                              color: ColorManager.midBlueColor, size: 27))),
                  question_TextFormField(
                      fieldName: 'Service Description',
                      hintText: 'Enter Service Description....',
                      controller: descriptionController,
                      maxLines: 5),
                  SizedBox(height: 100.h),
                  Center(
                      child: SmallElevatedbutton(
                          text: 'Send Request',
                          onTap: () {
                            showRequestSentBottomSheet();
                          }))
                ])))));
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestSent_BottomSheet();
        });
  }
}
