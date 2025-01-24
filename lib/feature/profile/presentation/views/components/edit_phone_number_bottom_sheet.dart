import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class EditPhoneNumberBottomSheet extends StatelessWidget {
  const EditPhoneNumberBottomSheet({
    super.key,
    required this.mobileNumberController,
  });

  final TextEditingController mobileNumberController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Consumer<MyProfileProvider>(
          builder: (context, provider, child) => Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomPhoneField(
                    fieldName: AppLocalizations.of(context)!.mobileNumber,
                    hintText: AppLocalizations.of(context)!.enterYourMobileNumber,
                    controller: mobileNumberController,
                    onChanged: (phone) {
                      provider.completePhoneNumber = phone.completeNumber;
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomSmallElevatedButton(
                      text: AppLocalizations.of(context)!.save,
                      onPressed: () {
                        String currentPhoneNumber = mobileNumberController.text;

                        if (currentPhoneNumber.isEmpty || currentPhoneNumber.length < 9) {
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 2),
                              backgroundColor: ColorManager.midWhiteColor,
                              content: Text(
                                AppLocalizations.of(context)!.please_enter_valid_phone_number,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkRedColor),
                              )));
                        } else {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Routes.verifyOTPRoute);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
