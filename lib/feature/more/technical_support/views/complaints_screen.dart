import 'package:bacura_app/core/utils/index.dart';

class ComplaintScreen extends StatefulWidget {
  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  var cameraTypeController = TextEditingController();
  var camerasNumberController = TextEditingController();
  var propertyTypeController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String selectedCity = 'مقد الخدمة';

  @override
  Widget build(BuildContext context) {
    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: AppStrings.confirm,
          imagePath: AppAssets.badFeedback,
          content: const Text(AppStrings.yourComplaintSentSuccessfully),
          onCancel: () {
            Navigator.of(context).pop();
          },
          onOk: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                ModalRoute.withName(Routes.homeRoute)); // Will remove all routes until this one
          },
        ),
      );
    }

    final List<String> options = [
      AppLocalizations.of(context)!.service_provider,
      AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.technician,
      AppLocalizations.of(context)!.customer_Service,
    ];
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.complaints)),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.ph30, horizontal: AppSizes.pw16),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomDropDownField(
                  selectedOption: AppLocalizations.of(context)!.service_provider,
                  options: options,
                  fieldName: AppLocalizations.of(context)!.complaint_type,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCity = newValue!;
                    });
                  },
                ),
                SizedBox(height: AppSizes.ph20),
                CustomQuestionTextFormField(
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
                SizedBox(height: AppSizes.ph60),
                Center(
                    child: CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.send_complaint,
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      showCustomDialog(context);
                    }
                  },
                ))
              ])))),
    );
  }
}
