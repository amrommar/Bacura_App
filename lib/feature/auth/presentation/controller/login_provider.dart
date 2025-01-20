import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/usecases/verify_usecase.dart';
import 'package:bacura_app/feature/auth/presentation/views/components/verify_bottom_sheet.dart';

class LoginProvider with ChangeNotifier {
  var mobileNumberController = TextEditingController();

  void onLoginSubmit(BuildContext context) {
    final mobileNumber = mobileNumberController.text;

    if (mobileNumber.isEmpty || mobileNumber.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: ColorManager.midWhiteColor,
        content: Text(
          AppLocalizations.of(context)!.please_enter_valid_phone_number,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkRedColor),
        ),
      ));
    } else {
      print(mobileNumberController.text);
      showVerifyBottomSheet(context);
    }
  }

  void showVerifyBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return VerifyBottomSheet();
        });
  }

  String pinCode = "";
  late VerifyOtpEntity verifyOtpEntity;

  Future<void> validatePin(BuildContext context) async {
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
      var result = await sl<VerifyOTPUseCase>().call(
        VerifyParameter(
          phone: mobileNumberController.text,
          countryCode: AppConstants.countryCode,
          otp: pinCode,
        ),
      );
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
        title: 'تم تسجيل الدخول بنجاح',
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
