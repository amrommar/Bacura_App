import 'package:bacura_app/core/utils/index.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //logo container-----------------------
              const BacuraLogoContainer(),
              SizedBox(height: 20),
              //page title____________________________
              Text(
                AppLocalizations.of(context)!.create_an_account,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Divider(color: ColorManager.lightBlueColor),
              //form for Name And Mobile Number ___________________________________
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Form(
                      key: formKey, // <-- Added form key here
                      child: Column(children: [
                        // Name Field ____________________________________________
                        CustomTextFormField(
                            fieldName: AppLocalizations.of(context)!.fullName,
                            controller: nameController,
                            hintText: AppLocalizations.of(context)!.enterYourName,
                            isObsucre: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterYourName;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text),
                        SizedBox(height: 10.h),
                        // Email Field ____________________________________________
                        CustomTextFormField(
                            fieldName: AppLocalizations.of(context)!.email,
                            controller: emailController,
                            hintText: AppLocalizations.of(context)!.enter_your_email,
                            isObsucre: false,
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
                            keyboardType: TextInputType.text),
                        SizedBox(height: 10.h),
                        // City Field ____________________________________________
                        DropDown_Field(
                            selectedOption: 'الرياض',
                            options: ['جده', 'الرياض'],
                            fieldName: AppLocalizations.of(context)!.city),
                        // Gender Field ____________________________________________

                        DropDown_Field(
                            selectedOption: 'ذكر',
                            options: ['ذكر', 'Female'],
                            fieldName: AppLocalizations.of(context)!.gender),
                        SizedBox(height: 10.h),
                      ]))),
              SizedBox(height: 20.h),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // Validate the form before proceeding
                        if (formKey.currentState?.validate() == true) {
                          Navigator.pushNamed(context, Routes.verifyOTPRoute);
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.register,
                          style: Theme.of(context).textTheme.titleMedium))),
              SizedBox(height: 18.h),
            ])));
  }
}
