import 'package:bacura_app/core/utils/index.dart';

class RegisterPhoneField extends StatelessWidget {
  final String hintText;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChanged; // Added onChanged for flexibility

  const RegisterPhoneField({
    super.key,
    required this.hintText,
    this.validator,
    required this.controller,
    this.onChanged, // Accepting onChanged
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return IntlPhoneField(
      textAlign: TextAlign.start,
      initialCountryCode: 'SA',
      languageCode: provider.appLanguage,
      onChanged: onChanged ?? (phone) {},
      // Use the provided onChanged
      invalidNumberMessage: AppStrings.invalidMobileNumber,
      validator: validator ??
          (phone) {
            // Use the provided validator
            if (phone == null || phone.completeNumber.isEmpty) {
              return AppLocalizations.of(context)!.please_enter_valid_phone_number;
            }
            if (phone.number.length < 9) {
              return AppLocalizations.of(context)!.invalidMobileNumber;
            }
            return null;
          },
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ColorManager.darkBlueColor,
          ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph8),
        filled: true,
        fillColor: ColorManager.lightWhiteColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primaryBlueColor,
              width: AppSizes.pw1,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.midWhiteColor,
              width: AppSizes.pw1,
            ),
            borderRadius: BorderRadius.circular(AppSizes.br12)),
        hintText: hintText,
      ),
    );
  }
}
