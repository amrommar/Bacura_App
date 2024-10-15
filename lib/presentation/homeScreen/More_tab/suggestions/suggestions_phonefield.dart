import 'dart:async';

import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class Suggestions_PhoneField extends StatelessWidget {
  String fieldName;
  String hintText;
  FutureOr<String?> Function(PhoneNumber?)? validator;
  TextEditingController controller;

  Suggestions_PhoneField({
    required this.fieldName,
    required this.hintText,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManager.darkBlueColor),
          ),
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
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorManager.greyColor)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.greyColor)),
          )
        ],
      ),
    );
  }
}
