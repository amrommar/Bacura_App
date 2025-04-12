import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';
import 'package:bacura_app/feature/auth/presentation/views/verify_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  var mobileNumberController = TextEditingController();
  final secureStorage = const FlutterSecureStorage();

  String pinCode = "";
  late VerifyDataEntity? verifyDataEntity;

  Future<void> validatePin(BuildContext context, String mobileNumber) async {
    Future.delayed(Duration.zero, () {});
    if (pinCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppStrings.pleaseEnterOTP),
        backgroundColor: Colors.red,
      ));
    } else if (pinCode.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.pleaseEnterRightOTP),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      var result = await sl<VerifyOTPUseCase>().call(
        VerifyParameter(
          phone: mobileNumber,
          countryCode: AppConstants.countryCode,
          otp: pinCode,
        ),
      );
      result.fold((l) {
        customShowCustomDialog(
          context: context,
          title: AppStrings.pleaseVerifyOTP,
          imagePath: AppAssets.badFeedback,
          content: AppStrings.oTPMayBeWrongTryAgain,
          isOk: false,
          isCancel: true,
          onCancel: () {
            Navigator.pop(context);
          },
          onOk: () {},
        );
      }, (r) {
        verifyDataEntity = r;

        if (verifyDataEntity?.token != null) {
          secureStorage.write(key: AppStrings.token, value: verifyDataEntity?.token);
        }

        customShowCustomDialog(
            context: context,
            title: AppStrings.successfulLogin,
            imagePath: AppAssets.checkedIcon,
            content: AppStrings.successfulLogin,
            isOk: true,
            isCancel: false,
            onCancel: () {},
            onOk: () async {
              if (verifyDataEntity?.role == 'Service Provider') {
                Navigator.pushNamed(context, Routes.spHomeScreenRoute);
              } else {
                if (verifyDataEntity?.isCompleted == true) {
                  Navigator.pushNamed(context, Routes.homeRoute);
                } else {
                  Navigator.pushNamed(context, Routes.completeProfileRoute);
                }
              }
            });
      });
    }
  }

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
      verifyOtp(countryCode: AppConstants.countryCode, mobileNumber: mobileNumberController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyScreen(
                    mobileNumber: mobileNumberController.text,
                  )));
    }
  }

  void verifyOtp({required String mobileNumber, required String countryCode}) {
    sl<LoginUseCase>().call(LoginParameter(phone: mobileNumber, countryCode: AppConstants.countryCode));
  }
// void showVerifyBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return VerifyBottomSheet(
//           mobileNumber: mobileNumberController.text,
//         );
//       });
// }
}
