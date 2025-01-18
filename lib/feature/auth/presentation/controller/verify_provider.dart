import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:bacura_app/feature/auth/presentation/controller/auth_provider.dart';
import 'package:get/get.dart';

class VerifyProvider extends ChangeNotifier {
  String pinCode = "";
  late VerifyOtpEntity verifyOtpEntity;

  Future<void> validatePin(BuildContext context) async {
    print('params');

    if (pinCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.please_enter_the_OTP),
        backgroundColor: Colors.red,
      ));
    } else if (pinCode.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.otp_must_be_four_digits),
        backgroundColor: Colors.red,
      ));
    } else {
      // check phone number
      var result = await sl<VerifyOTPUseCase>().call(VerifyParameter(phone: '536885692', countryCode: AppConstants.countryCode, otp: pinCode));
      result.fold((l) {}, (r) {
        verifyOtpEntity = r;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(AppLocalizations.of(context)!.otp_verified),
            backgroundColor: Colors.green,
          ),
        );

        showCustomDialog(context);
      });
    }
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: AppLocalizations.of(context)!.continue_to_pay,
        imagePath: 'assets/images/bad-feedback.png',
        content: const Text('تم تسجيل الدخول بنجاح'),
        onCancel: () {
          Navigator.of(context).pop();
        },
        onOk: () {
          Navigator.pushNamed(context, Routes.homeScreenRoute);
        },
      ),
    );
  }
}
