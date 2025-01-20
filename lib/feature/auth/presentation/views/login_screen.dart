import 'package:bacura_app/core/utils/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(ImageAssets.background2Image),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: 30.h,
              ),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 100.h,
            ),
            backgroundColor: ColorManager.transparent,
            body: Consumer<LoginProvider>(builder: (context, provider, child) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 65.h),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        // logo container
                        const BacuraLogoWidget(),
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
                      ])));
            })),
      )
    ]);
  }
}
