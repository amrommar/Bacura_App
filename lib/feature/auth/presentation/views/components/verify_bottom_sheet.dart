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
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) => Container(
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(AppSizes.br30),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.ph30,
              horizontal: AppSizes.pw30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
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
                ChangeNumberWidget(mobileNumber: widget.mobileNumber),
                Form(
                  key: formKey,
                  child: CustomPinCodeTextField(
                    onChanged: (value) {
                      provider.pinCode = value;
                    },
                  ),
                ),
                const Spacer(),
                VerifyButtonWidget(
                  onPressed: () {
                    provider.validatePin(
                      context,
                      widget.mobileNumber,
                    );
                  },
                ),
                const ResendOtpAgainWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
