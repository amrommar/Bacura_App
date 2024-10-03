import 'dart:async';

import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class Custom_PhoneField extends StatelessWidget {
  String fieldName;
  String hintText;
  FutureOr<String?> Function(PhoneNumber?)? validator;
  TextEditingController controller;

  Custom_PhoneField({
    required this.fieldName,
    required this.hintText,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
          //Language for phone Field______________________________________
          languageCode: 'ar',

          invalidNumberMessage: AppStrings.invalidMobileNumber,
          validator: validator,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.darkBlueColor),
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.greyColor)),
        )
      ],
    );
  }
}
