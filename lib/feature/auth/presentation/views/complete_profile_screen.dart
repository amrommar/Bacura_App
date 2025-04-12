import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/presentation/controller/complete_profile_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();

    return Stack(children: [
      Image.asset(
        AppAssets.background2Image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: AppSizes.ph30,
              ),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: AppSizes.ph40),
          backgroundColor: ColorManager.transparent,
          body: SingleChildScrollView(
              child: ChangeNotifierProvider(
            create: (context) => CompleteProfileProvider(),
            child: Consumer<CompleteProfileProvider>(
              builder: (context, provider, child) => Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.pw30),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const BacuraLogoWidget(),
                    SizedBox(height: AppSizes.ph20),
                    Text(
                      AppLocalizations.of(context)!.create_an_account,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Divider(color: ColorManager.lightBlueColor),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw8),
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
                                keyBoardType: TextInputType.text),
                            SizedBox(height: AppSizes.ph10),
                            CustomTextFormField(
                                fieldName: AppLocalizations.of(context)!.email,
                                controller: provider.emailController,
                                hintText: AppLocalizations.of(context)!.enter_your_email,
                                isObscures: false,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.enter_your_email;
                                  }
                                  final bool emailValid =
                                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(text);
                                  if (!emailValid) {
                                    return AppLocalizations.of(context)!.please_enter_valid_email;
                                  }
                                  return null;
                                },
                                keyBoardType: TextInputType.text),
                            SizedBox(height: AppSizes.ph10),
                            CustomDropDownField(
                              selectedOption: AppStrings.riyad,
                              options: [
                                AppStrings.riyad,
                                AppStrings.jeddah,
                                AppStrings.damam,
                                AppStrings.makka,
                                AppStrings.madinah,
                                AppStrings.jezan,
                                AppStrings.taif,
                                AppStrings.abha,
                                AppStrings.tabouk,
                                AppStrings.khobar,
                              ],
                              fieldName: AppLocalizations.of(context)!.city,
                              onChanged: (String? newValue) {
                                if (newValue == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    duration: const Duration(seconds: 1),
                                    backgroundColor: ColorManager.midWhiteColor,
                                    content: Text(
                                      AppStrings.pleaseSelectCity,
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            color: ColorManager.darkRedColor,
                                          ),
                                    ),
                                  ));
                                }

                                provider.selectedLocation = newValue!;
                              },
                            ),
                            CustomDropDownField(
                              selectedOption: AppStrings.male,
                              options: const [
                                AppStrings.male,
                                AppStrings.female,
                              ],
                              fieldName: AppLocalizations.of(context)!.gender,
                              onChanged: (String? newValue) {
                                if (newValue == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: ColorManager.midWhiteColor,
                                    content: Text(
                                      AppStrings.pleaseSelectGender,
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            color: ColorManager.darkRedColor,
                                          ),
                                    ),
                                  ));
                                }
                                newValue == AppStrings.male
                                    ? provider.selectedGender = 'male'
                                    : provider.selectedGender = 'female';
                              },
                            ),
                            SizedBox(height: AppSizes.ph10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.ph20),
                    Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              String? accessToken = await secureStorage.read(key: AppStrings.token);

                              // Validate the form before proceeding
                              if (formKey.currentState?.validate() == true) {
                                if (accessToken != null) {
                                  print('accessToken: $accessToken');
                                } else {
                                  print('accessToken: null');
                                }
                                provider.completeProfile(context);
                              }
                            },
                            child: Text(AppLocalizations.of(context)!.register,
                                style: Theme.of(context).textTheme.titleMedium))),
                    SizedBox(height: AppSizes.ph18),
                  ])),
            ),
          )))
    ]);
  }
}
