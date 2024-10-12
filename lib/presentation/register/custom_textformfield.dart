import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_TextFormField extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObsucre;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  Custom_TextFormField({
    required this.fieldName,
    required this.hintText,
    this.suffixIcon,
    this.isObsucre = false,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
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
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.darkBlueColor),
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObsucre,
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
