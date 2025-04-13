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
          title: Text(tr(AppStrings.suggestions)),
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
                        fieldName: tr(AppStrings.fullName),
                        hintText: tr(AppStrings.enterYourName),
                        controller: provider.nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return tr(AppStrings.pleaseEnterYourName);
                          }
                          return null;
                        },
                      ),
                      CustomQuestionTextFormField(
                        fieldName: tr(AppStrings.email),
                        hintText: tr(AppStrings.enterEmail),
                        controller: provider.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return tr(AppStrings.pleaseEnterEmail);
                          }

                          if (!Validation.checkEmail(email: text)) {
                            return tr(AppStrings.pleaseEnterValidEmail);
                          }
                          return null;
                        },
                      ),
                      CustomPhoneField(
                        fieldName: tr(AppStrings.mobileNumber),
                        hintText: tr(AppStrings.enterYourMobileNumber),
                        controller: provider.mobileNumberController,
                        onChanged: (phone) {
                          provider.onChangePhoneNumber(phone.completeNumber);
                        },
                      ),
                      CustomQuestionTextFormField(
                        fieldName: tr(AppStrings.yourSuggestions),
                        hintText: tr(AppStrings.yourSuggestionsHint),
                        controller: provider.suggestionsController,
                        maxLines: 8,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return tr(AppStrings.pleaseEnterSuggestions);
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
                                    tr(AppStrings.pleaseEnterAllData),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: ColorManager.darkRedColor),
                                  )));
                            }
                          },
                          child: Text(
                            tr(AppStrings.send),
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
