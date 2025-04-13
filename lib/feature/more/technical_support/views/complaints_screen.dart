import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/technical_support/controller/complaints_provider.dart';

class ComplaintScreen extends StatefulWidget {
  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final List<String> options = [
      tr(AppStrings.serviceProvider),
      tr(AppStrings.serviceType),
      tr(AppStrings.technician),
      tr(AppStrings.customerService),
    ];
    return ChangeNotifierProvider(
      create: (BuildContext context) => ComplaintsProvider(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          tr(AppStrings.complaints),
        )),
        body: Consumer<ComplaintsProvider>(
          builder: (context, provider, child) {
            return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.ph30,
                  horizontal: AppSizes.pw16,
                ),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      CustomDropDownField(
                        selectedOption: tr(AppStrings.serviceProvider),
                        options: options,
                        fieldName: tr(AppStrings.complaintType),
                        onChanged: (String? newValue) {
                          setState(() {
                            provider.selectedOption = newValue!;
                          });
                        },
                      ),
                      SizedBox(height: AppSizes.ph20),
                      CustomQuestionTextFormField(
                        fieldName: tr(AppStrings.yourComplaint),
                        hintText: tr(AppStrings.enterYourComplaint),
                        controller: provider.complaintController,
                        maxLines: 7,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return tr(AppStrings.pleaseEnterYourComplaint);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSizes.ph60),
                      Center(
                          child: CustomSmallElevatedButton(
                        text: tr(AppStrings.sendComplaint),
                        onPressed: () {
                          provider.sendComplaints(context);
                        },
                      ))
                    ]))));
          },
        ),
      ),
    );
  }
}
