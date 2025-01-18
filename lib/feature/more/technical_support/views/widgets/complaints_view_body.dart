import 'package:bacura_app/core/utils/index.dart';

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
