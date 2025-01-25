import 'package:bacura_app/core/utils/index.dart';

class ResendOtpAgainWidget extends StatelessWidget {
  const ResendOtpAgainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.sendOTPAgain,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 20.w),
        Text(
          '60',

          ///==================================================== want counter to resend OTP again
          ///===============================================================================================
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.greyColor,
              ),
        )
      ],
    );
  }
}
