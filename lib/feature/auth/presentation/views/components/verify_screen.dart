import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';

class VerifyScreen extends StatefulWidget {
  final String mobileNumber;

  VerifyScreen({super.key, required this.mobileNumber});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(AppAssets.background2Image, width: double.infinity, height: double.infinity, fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(color: ColorManager.primaryBlueColor, size: AppSizes.ph30),
              backgroundColor: ColorManager.transparent,
              elevation: 0,
              toolbarHeight: AppSizes.ph100),
          backgroundColor: ColorManager.transparent,
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) => Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.pw29),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const BacuraLogoWidget(),
                    SizedBox(height: AppSizes.ph50),
                    Text(
                      AppLocalizations.of(context)!.oTPNumber,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Divider(color: ColorManager.lightBlueColor),
                    SizedBox(height: AppSizes.ph10),
                    Text(AppLocalizations.of(context)!.oTPNumberSent,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorManager.greyColor,
                            )),
                    ChangeNumberWidget(
                      mobileNumber: widget.mobileNumber,
                    ),
                    SizedBox(height: AppSizes.ph30),
                    SizedBox(
                      height: AppSizes.ph100,
                      child: Form(
                        key: formKey,
                        child: CustomPinCodeTextField(
                          onChanged: (value) {
                            provider.pinCode = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.ph50),
                    Center(
                        child: Column(children: [
                      VerifyButtonWidget(
                        onPressed: () {
                          provider.validatePin(context, widget.mobileNumber);
                        },
                      ),
                      SizedBox(height: AppSizes.ph20),
                      const ResendOtpAgainWidget()
                    ]))
                  ])),
            ),
          ))
    ]);
  }
}
