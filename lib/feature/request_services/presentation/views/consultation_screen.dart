import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/index.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.consultation_screen),
        ),
        body: Form(
            key: formKey,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: ListView(children: [
                  /// drop down to choose type of consultation
                  ConsultationDropDownField(),

                  /// consultation description
                  CustomQuestionTextFormField(
                      fieldName: AppLocalizations.of(context)!.consultation_description,
                      hintText: AppLocalizations.of(context)!.describe_your_consultation,
                      controller: descriptionController,
                      maxLines: 6,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.please_describe_your_consultation;
                        }
                        return null;
                      }),
                  SizedBox(height: 10.h),

                  /// note of the consultation response
                  const ConsultationNoteWidget(),
                  SizedBox(height: 100.h),
                  Center(
                      child: CustomSmallElevatedButton(
                          text: AppLocalizations.of(context)!.send,
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              showRequestSentBottomSheet();
                            }
                          }))
                ]))));
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const RequestSentBottomSheet();
        });
  }
}
