import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomRegistrationTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomRegistrationTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
          controller: controller,
          validator: validator,
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
          )),
    );
  }
}
