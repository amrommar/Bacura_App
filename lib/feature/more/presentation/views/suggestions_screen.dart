import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/core/validation/validation.dart';
import 'package:bacura_app/feature/more/presentation/controller/suggestions_provider.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (BuildContext context) => SuggestionsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.suggestions),
        ),
        body: Consumer<SuggestionsProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw16),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomQuestionTextFormField(
                        fieldName: AppLocalizations.of(context)!.fullName,
                        hintText: AppLocalizations.of(context)!.enterYourName,
                        controller: provider.nameController,
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
                        controller: provider.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.please_enter_your_email;
                          }

                          if (!Validation.checkEmail(email: text)) {
                            return AppLocalizations.of(context)!.please_enter_valid_email;
                          }
                          return null;
                        },
                      ),
                      CustomPhoneField(
                        fieldName: AppLocalizations.of(context)!.mobileNumber,
                        hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                        controller: provider.mobileNumberController,
                        onChanged: (phone) {
                          provider.onChangePhoneNumber(phone.completeNumber);
                        },
                      ),
                      CustomQuestionTextFormField(
                        fieldName: AppLocalizations.of(context)!.your_suggestions,
                        hintText: AppLocalizations.of(context)!.your_suggestions_is_important,
                        controller: provider.suggestionsController,
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
                            if (formKey.currentState?.validate() == true &&
                                (provider.completePhoneNumber != null &&
                                    provider.completePhoneNumber!.isNotEmpty &&
                                    provider.completePhoneNumber!.length > 8)) {
                              provider.sendSuggestions(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: ColorManager.midWhiteColor,
                                  content: Text(
                                    AppLocalizations.of(context)!.please_enter_all_data,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: ColorManager.darkRedColor),
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
            );
          },
        ),
      ),
    );
  }
}
