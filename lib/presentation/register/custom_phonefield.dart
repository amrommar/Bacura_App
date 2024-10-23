import 'dart:async';

import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhone_Field extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChanged; // Added onChanged for flexibility

  CustomPhone_Field({
    required this.fieldName,
    required this.hintText,
    this.validator,
    required this.controller,
    this.onChanged, // Accepting onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.darkBlueColor),
        ),
        SizedBox(height: 10.h),
        IntlPhoneField(
          textAlign: TextAlign.start,
          initialCountryCode: 'SA',
          languageCode: 'ar',
          onChanged: onChanged ?? (phone) {},
          // Use the provided onChanged
          invalidNumberMessage: AppStrings.invalidMobileNumber,
          validator: validator ??
              (phone) {
                // Use the provided validator
                if (phone == null || phone.completeNumber.isEmpty) {
                  return 'Please enter a valid phone number';
                }
                if (phone.number.length < 9) {
                  return 'Invalid Phone number';
                }
                return null;
              },
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.darkBlueColor),
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.greyColor)),
        )
      ],
    );
  }
}
