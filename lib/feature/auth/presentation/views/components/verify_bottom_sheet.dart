import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';

class VerifyBottomSheet extends StatefulWidget {
  final String mobileNumber;

  const VerifyBottomSheet({super.key, required this.mobileNumber});

  @override
  State<VerifyBottomSheet> createState() => _VerifyBottomSheetState();
}

class _VerifyBottomSheetState extends State<VerifyBottomSheet> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) => Container(
            height: 500.h,
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              ChangeNumberWidget(mobileNumber: widget.mobileNumber),
              SizedBox(height: 30.h),
              Form(
                key: formKey,
                child: CustomPinCodeTextField(
                  onChanged: (value) {
                    provider.pinCode = value;
                  },
                ),
              ),
              SizedBox(height: 70.h),
              Center(
                  child: Column(children: [
                VerifyButtonWidget(
                  onPressed: () {
                    provider.validatePin(
                      context,
                      widget.mobileNumber,
                    );
                  },
                ),
                SizedBox(height: 20.h),
                const ResendOtpAgainWidget()
              ]))
            ])),
      ),
    );
  }
}
