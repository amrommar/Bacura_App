import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/dropdown_field.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/question_textformfield.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      AppLocalizations.of(context)!.service_provider,
      AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.technician,
      AppLocalizations.of(context)!.customer_Service,
    ];
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.complaints)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropDown_Field(
                  selectedOption: AppLocalizations.of(context)!.service_provider,
                  options: options,
                  fieldName: AppLocalizations.of(context)!.complaint_type,
                ),
                SizedBox(height: 20.h),
                question_TextFormField(
                  fieldName: AppLocalizations.of(context)!.your_complaint,
                  hintText: AppLocalizations.of(context)!.enter_your_complaint,
                  controller: descriptionController,
                  maxLines: 7,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_your_complaint;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 60.h),
                Center(
                  child: SmallElevatedbutton(
                    text: AppLocalizations.of(context)!.send_complaint,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        Navigator.pop(context);
                      }
                    },
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
