import 'package:bacura_app/core/utils/index.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var suggestionsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.suggestions),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomQuestionTextFormField(
                  fieldName: AppLocalizations.of(context)!.fullName,
                  hintText: AppLocalizations.of(context)!.enterYourName,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterYourName;
                    }
                    return null;
                  },
                ),
                CustomQuestionTextFormField(
                  fieldName: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.enter_your_email,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_your_email;
                    }
                    final bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                    if (!emailValid) {
                      return AppLocalizations.of(context)!.please_enter_valid_email;
                    }
                    return null;
                  },
                ),
                CustomPhoneField(
                  fieldName: AppLocalizations.of(context)!.mobileNumber,
                  hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                  controller: mobileNumberController,
                  onChanged: (phone) {
                    setState(() {
                      completePhoneNumber = phone.completeNumber;
                    });
                  },
                ),
                CustomQuestionTextFormField(
                  fieldName: AppLocalizations.of(context)!.your_suggestions,
                  hintText: AppLocalizations.of(context)!.your_suggestions_is_important,
                  controller: suggestionsController,
                  maxLines: 8,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_your_suggestions;
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes.ph70),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(AppSizes.pw170, AppSizes.ph50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.br8))),
                    onPressed: () {
                      // Validate the form before proceeding
                      if (formKey.currentState?.validate() == true &&
                          (completePhoneNumber != null &&
                              completePhoneNumber!.isNotEmpty &&
                              completePhoneNumber!.length > 8)) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: ColorManager.midWhiteColor,
                            content: Text(
                              AppLocalizations.of(context)!.please_enter_all_data,
                              style:
                                  Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkRedColor),
                            )));
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.send,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
