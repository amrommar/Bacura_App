import 'package:bacura_app/core/utils/index.dart';

class ConsultationViewBody extends StatefulWidget {
  const ConsultationViewBody({super.key});

  @override
  State<ConsultationViewBody> createState() => _ConsultationViewBodyState();
}

class _ConsultationViewBodyState extends State<ConsultationViewBody> {
  //// from Back-End ///////////

  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: ListView(children: [
              /// drop down to choose type of consultation
              ConsultationDropDownField(),

              /// consultation description
              questionTextFormField(
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
              const ConsultationNoteRow(),
              SizedBox(height: 100.h),
              Center(
                  child: SmallElevatedButton(
                      text: AppLocalizations.of(context)!.send,
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          showRequestSentBottomSheet();
                        }
                      }))
            ])));
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestSent_BottomSheet();
        });
  }
}
