import 'package:bacura_app/core/utils/index.dart';

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
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkRedColor,
              ),
        ),
      ));
    } else {
      print(mobileNumberController.text);
      Navigator.pushNamed(
        context,
        Routes.verifyOTPRoute,
        arguments: mobileNumber,
      );
    }
  }
}
