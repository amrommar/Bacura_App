import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(AppAssets.background2Image, width: double.infinity, height: double.infinity, fit: BoxFit.fill),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: ColorManager.primaryBlueColor,
                size: AppSizes.ph30,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              toolbarHeight: AppSizes.ph50,
              shadowColor: Colors.transparent,
            ),
            backgroundColor: ColorManager.transparent,
            body: Consumer<AuthProvider>(builder: (context, provider, child) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw29, vertical: AppSizes.ph70),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        // logo container
                        const BacuraLogoWidget(),
                        SizedBox(height: AppSizes.ph50),
                        // page title
                        Text(AppLocalizations.of(context)!.login, style: Theme.of(context).textTheme.displayLarge),
                        Divider(color: ColorManager.lightBlueColor),
                        // form for Name And Mobile Number
                        Padding(
                            padding: EdgeInsets.all(AppSizes.ph8),
                            child: Column(children: [
                              // Mobile Number Field
                              CustomPhoneField(
                                fieldName: AppLocalizations.of(context)!.mobileNumber,
                                hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                                controller: provider.mobileNumberController,
                              )
                            ])),
                        SizedBox(height: AppSizes.ph20),
                        Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  provider.onLoginSubmit(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.login,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ))),
                        SizedBox(height: AppSizes.ph20)
                      ])));
            })),
      )
    ]);
  }
}
