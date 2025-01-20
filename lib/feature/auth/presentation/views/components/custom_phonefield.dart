import 'package:bacura_app/core/utils/index.dart';

class CustomPhoneField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChanged; // Added onChanged for flexibility

  const CustomPhoneField({
    super.key,
    required this.fieldName,
    required this.hintText,
    this.validator,
    required this.controller,
    this.onChanged, // Accepting onChanged
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.darkBlueColor,
                )),
        SizedBox(height: 10.h),
        IntlPhoneField(
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
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  )),
        )
      ],
    );
  }
}
