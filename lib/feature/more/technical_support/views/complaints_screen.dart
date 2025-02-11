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
      AppLocalizations.of(context)!.service_provider,
      AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.technician,
      AppLocalizations.of(context)!.customer_Service,
    ];
    return ChangeNotifierProvider(
      create: (BuildContext context) => ComplaintsProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.complaints)),
        body: Consumer<ComplaintsProvider>(
          builder: (context, provider, child) {
            return Padding(
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
                            provider.selectedOption = newValue!;
                          });
                        },
                      ),
                      SizedBox(height: AppSizes.ph20),
                      CustomQuestionTextFormField(
                        fieldName: AppLocalizations.of(context)!.your_complaint,
                        hintText: AppLocalizations.of(context)!.enter_your_complaint,
                        controller: provider.complaintController,
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
