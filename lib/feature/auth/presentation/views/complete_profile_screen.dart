import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/complete_profile_provider.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(ImageAssets.background2Image),
      Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: 30.h,
              ),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 40.h),
          backgroundColor: ColorManager.transparent,
          body: SingleChildScrollView(
              child: ChangeNotifierProvider(
            create: (context) => CompleteProfileProvider(),
            child: Consumer<CompleteProfileProvider>(
              builder: (context, provider, child) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const BacuraLogoWidget(),
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.create_an_account,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Divider(color: ColorManager.lightBlueColor),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                                fieldName: AppLocalizations.of(context)!.fullName,
                                controller: provider.nameController,
                                hintText: AppLocalizations.of(context)!.enterYourName,
                                isObscures: false,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.pleaseEnterYourName;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text),
                            SizedBox(height: 10.h),
                            CustomTextFormField(
                                fieldName: AppLocalizations.of(context)!.email,
                                controller: provider.emailController,
                                hintText: AppLocalizations.of(context)!.enter_your_email,
                                isObscures: false,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.enter_your_email;
                                  }
                                  final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                                  if (!emailValid) {
                                    return AppLocalizations.of(context)!.please_enter_valid_email;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text),
                            SizedBox(height: 10.h),
                            CustomDropDownField(
                              selectedOption: 'الرياض',
                              options: const ['جده', 'الرياض'],
                              fieldName: AppLocalizations.of(context)!.city,
                              onChanged: (String? newValue) {
                                if (newValue == null) {
                                  //!add snakbar to add city
                                }
                                provider.selectedLocation = newValue!;
                              },
                            ),
                            CustomDropDownField(
                              selectedOption: 'ذكر',
                              options: const ['ذكر', 'أنثي'],
                              fieldName: AppLocalizations.of(context)!.gender,
                              onChanged: (String? newValue) {
                                if (newValue == null) {
                                  //!add snakbar to add gender
                                }

                                provider.selectedGender = newValue!;
                              },
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              // Validate the form before proceeding
                              if (formKey.currentState?.validate() == true) {
                                provider.completeProfile(context);
                              }
                            },
                            child: Text(AppLocalizations.of(context)!.register, style: Theme.of(context).textTheme.titleMedium))),
                    SizedBox(height: 18.h),
                  ])),
            ),
          )))
    ]);
  }
}
