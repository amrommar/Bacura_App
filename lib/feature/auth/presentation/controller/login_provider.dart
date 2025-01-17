import 'package:bacura_app/core/services/dependency_injection_services.dart';
import 'package:bacura_app/core/utils/app_constants.dart';
import 'package:bacura_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bacura_app/feature/auth/index.dart';

class LoginProvider with ChangeNotifier {
  var mobileNumberController = TextEditingController();

  void onLoginSubmit(BuildContext context) {
    if (mobileNumberController.text.isEmpty || mobileNumberController.text.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: ColorManager.midWhiteColor,
          content: Text(
            AppLocalizations.of(context)!.please_enter_valid_phone_number,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkRedColor),
          )));
    } else {
      sl<LoginUseCase>().call(LoginParameter(phone: mobileNumberController.text, countryCode: AppConstants.countryCode));
      Navigator.pushNamed(context, Routes.verifyOTPRoute);
    }
  }
}
