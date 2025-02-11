import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/index.dart';
import 'package:bacura_app/feature/auth/presentation/views/components/verify_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  var mobileNumberController = TextEditingController();
  final secureStorage = const FlutterSecureStorage();

  String pinCode = "";
  late VerifyDataEntity? verifyDataEntity;

  Future<void> validatePin(BuildContext context, String mobileNumber) async {
    Future.delayed(Duration.zero, () {});
    if (pinCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('الرجاء ادخال رمز التحقيق'),
        backgroundColor: Colors.red,
      ));
    } else if (pinCode.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('الرجاء ادخال رمز التحقيق'),
        backgroundColor: Colors.red,
      ));
    } else {
      // check phone number
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
          title: 'الرجاء التاكد من رمز التحقيق',
          imagePath: 'assets/images/png/bad-feedback.png',
          content: 'رمز التحقق قد يكون خاطئ ارجوك حاولا ثانياً',
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
          secureStorage.write(key: 'token', value: verifyDataEntity?.token);
        }

        customShowCustomDialog(
            context: context,
            title: 'تم تسجيل الدخول بنجاح',
            imagePath: 'assets/images/png/checked.png',
            content: 'تم تسجيل الدخول بنجاح',
            isOk: true,
            isCancel: false,
            onCancel: () {},
            onOk: () async {
              if (verifyDataEntity?.role == 'Admin') {
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
      sl<LoginUseCase>()
          .call(LoginParameter(phone: mobileNumberController.text, countryCode: AppConstants.countryCode));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyScreen(
                    mobileNumber: mobileNumberController.text,
                  )));
    }
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
