import 'package:bacura_app/feature/auth/index.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // logo container
                const BacuraLogoContainer(),
                SizedBox(height: 50.h),
                // page title
                Text(AppLocalizations.of(context)!.login, style: Theme.of(context).textTheme.displayLarge),
                Divider(color: ColorManager.lightBlueColor),
                // form for Name And Mobile Number
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      // Mobile Number Field
                      CustomPhoneField(
                        fieldName: AppLocalizations.of(context)!.mobileNumber,
                        hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                        controller: provider.mobileNumberController,
                      )
                    ])),
                SizedBox(height: 20.h),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          provider.onLoginSubmit(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.titleMedium,
                        ))),
                SizedBox(height: 20.h)
              ]))),
    );
  }
}
