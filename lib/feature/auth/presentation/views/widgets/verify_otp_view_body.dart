import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/presentation/controller/verify_provider.dart';

class VerifyOTPViewBody extends StatefulWidget {
  const VerifyOTPViewBody({super.key});

  @override
  State<VerifyOTPViewBody> createState() => _VerifyOTPViewBodyState();
}

class _VerifyOTPViewBodyState extends State<VerifyOTPViewBody> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = ModalRoute.of(context)!.settings.arguments as String?;
    return ChangeNotifierProvider(
      create: (context) => VerifyProvider(),
      child: Consumer<VerifyProvider>(
        builder: (context, provider, child) => Container(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const BacuraLogoContainer(),
              SizedBox(height: 50.h),
              Text(
                AppLocalizations.of(context)!.oTPNumber,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Divider(color: ColorManager.lightBlueColor),
              SizedBox(height: 10.h),
              Text(AppLocalizations.of(context)!.oTPNumberSent,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.greyColor,
                      )),
              const ChangeNumberRow(),
              SizedBox(height: 30.h),
              Form(
                  key: formKey,
                  child: CustomPinCodeTextField(onChanged: (value) {
                    provider.pinCode = value;
                  })),
              SizedBox(height: 50.h),
              Center(
                  child: Column(children: [
                VerifyButton(
                  onPressed: () {
                    provider.validatePin(context, mobileNumber ?? '');
                  },
                ),
                SizedBox(height: 20.h),
                const ResendOtpAgain()
              ]))
            ])),
      ),
    );
  }
}
