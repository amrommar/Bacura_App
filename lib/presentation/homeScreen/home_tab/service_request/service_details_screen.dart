import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/requestsent_bottomsheet.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../resources/color_manager.dart';

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
  var formKey = GlobalKey<FormState>();
  String locationAddress = 'Pick Location';

  String selectedOption = '9 ص - 1 م';
  final List<String> options = ['9 ص - 1 م', '1 م - 6 م'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.service_details)),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
            child: Form(
                key: formKey,
                child: SingleChildScrollView(
                    child: SafeArea(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ////////////////////     Set date Section     /////////////////////////////////////////
                  Text(AppLocalizations.of(context)!.set_date,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor)),
                  Container(
                    width: double.infinity,
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.date,
                      initTime: DateTime.now(),
                      minTime: DateTime.now().subtract(const Duration(seconds: 1)),
                      maxTime: DateTime.now().add(const Duration(days: 10)),
                      barrierColor: Colors.black12,
                      //Barrier Color when pop up show
                      minuteInterval: 1,
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      cancelText: AppLocalizations.of(context)!.cancel,
                      confirmText: AppLocalizations.of(context)!.ok,
                      pressType: PressType.singlePress,
                      timeFormat: 'dd/MM/yyyy',
                      // Customize your time widget
                      // timeWidgetBuilder: (dateTime) {},
                      onChange: (dateTime) {
                        // Implement your logic with select dateTime
                      },
                    ),
                  ),
                  ////////////////////     Set Time Section     /////////////////////////////////////////

                  SizedBox(height: 10.h),
                  DropDown_Field(
                      selectedOption: '9 ص - 1 م', options: options, fieldName: AppLocalizations.of(context)!.set_time),
                  //// Set location Section ///////////////////////////////////////
                  question_TextFormField(
                      fieldName: AppLocalizations.of(context)!.location,
                      hintText: AppLocalizations.of(context)!.click_icon_location,
                      controller: locationController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.please_set_location;
                        }
                        return null;
                      },
                      suffixIcon: InkWell(
                          onTap: () {
                            showLocationBottomSheet();
                          },
                          child: Icon(Icons.location_on_outlined, color: ColorManager.midBlueColor, size: 27))),
                  //// Write Service Description Section ///////////////////////////////////////

                  question_TextFormField(
                      fieldName: AppLocalizations.of(context)!.service_description,
                      hintText: AppLocalizations.of(context)!.enter_service_description,
                      controller: descriptionController,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.please_describe_your_consultation;
                        }
                        return null;
                      }),
                  SizedBox(height: 100.h),
                  Center(
                      child: SmallElevatedbutton(
                          text: AppLocalizations.of(context)!.send_request,
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              showRequestSentBottomSheet();
                            }
                          }))
                ]))))));
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestSent_BottomSheet();
        });
  }

  void showLocationBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 600.h,
            width: double.infinity,
            color: Colors.white,
            child: OpenStreetMapSearchAndPick(
                buttonColor: ColorManager.primaryBlueColor,
                buttonText: AppLocalizations.of(context)!.set_current_location,
                locationPinIconColor: ColorManager.darkRedColor,
                buttonWidth: 200.w,
                locationPinTextStyle:
                    Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor),
                onPicked: (pickedData) {
                  try {
                    Navigator.pop(context);
                    setState(() {
                      locationAddress = pickedData.addressName;
                      locationController.text = locationAddress;
                    });
                  } catch (e) {
                    print('Error: $e');
                  }
                }),
          );
        });
  }
}
