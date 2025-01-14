import 'package:bacura_app/core/utils/DialogUtils.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/home/presentation/views/home_view.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/dropdown_field.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/question_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintsViewBody extends StatelessWidget {
  var cameraTypeController = TextEditingController();
  var camerasNumberController = TextEditingController();
  var propertyTypeController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  ComplaintsViewBody({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'تأكيد',
        imagePath: 'assets/images/bad-feedback.png',
        content: const Text('تم إرسال شكواك بنجاح'),
        onCancel: () {
          Navigator.of(context).pop();
        },
        onOk: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
              ModalRoute.withName(Routes.homeScreenRoute)); // Will remove all routes until this one
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      AppLocalizations.of(context)!.service_provider,
      AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.technician,
      AppLocalizations.of(context)!.customer_Service,
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DropDown_Field(
                selectedOption: AppLocalizations.of(context)!.service_provider,
                options: options,
                fieldName: AppLocalizations.of(context)!.complaint_type,
              ),
              SizedBox(height: 20.h),
              questionTextFormField(
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
                  child: SmallElevatedButton(
                text: AppLocalizations.of(context)!.send_complaint,
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    showCustomDialog(context);
                  }
                },
              ))
            ]))));
  }
}
