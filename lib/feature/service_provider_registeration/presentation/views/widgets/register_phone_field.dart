import 'dart:async';

import 'package:bacura_app/core/providers/language_provider.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/strings_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';

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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        filled: true,
        fillColor: ColorManager.lightWhiteColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primaryBlueColor,
              width: AppSize.s1,
            ),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.midWhiteColor,
              width: AppSize.s1,
            ),
            borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
      ),
    );
  }
}
