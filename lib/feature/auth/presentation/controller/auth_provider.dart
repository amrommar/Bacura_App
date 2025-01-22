import 'package:bacura_app/core/utils/dialig_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/usecases/verify_usecase.dart';
import 'package:bacura_app/feature/auth/presentation/views/components/verify_bottom_sheet.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  var mobileNumberController = TextEditingController();
  final secureStorage = const FlutterSecureStorage();

  String pinCode = "";
  late VerifyOtpEntity? verifyOtpEntity;

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
      result.fold((l) {}, (r) {
        verifyOtpEntity = r;
        if (verifyOtpEntity?.error == null) {
          customShowCustomDialog(
              context: context,
              title: 'تم تسجيل الدخول بنجاح',
              imagePath: 'assets/images/bad-feedback.png',
              content: 'تم تسجيل الدخول بنجاح',
              isOk: true,
              isCancel: false,
              onCancel: () {},
              onOk: () {
                // if (verifyOtpEntity?.data?.token != null) {
                //   secureStorage.write(key: 'token', value: verifyOtpEntity?.data?.token);
                // }
                if (verifyOtpEntity?.data?.role == 'Admin') {
                  Navigator.pushNamed(context, Routes.spHomeScreenRoute);
                } else {
                  if (verifyOtpEntity?.data?.isCompleted == true) {
                    Navigator.pushNamed(context, Routes.homeRoute);
                  } else {
                    Navigator.pushNamed(context, Routes.completeProfileRoute);
                  }
                }
              });
        } else {
          customShowCustomDialog(
            context: context,
            title: 'الرجاء التاكد من رمز التحقيق',
            imagePath: 'assets/images/bad-feedback.png',
            content: 'رمز التحقق قد يكون خاطئ ارجوك حاولا ثانياً',
            isOk: false,
            isCancel: true,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onOk: () {},
          );
        }
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
      sl<LoginUseCase>().call(LoginParameter(phone: mobileNumberController.text, countryCode: AppConstants.countryCode));
      showVerifyBottomSheet(context);
    }
  }

  void showVerifyBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return VerifyBottomSheet(
            mobileNumber: mobileNumberController.text,
          );
        });
  }
}
