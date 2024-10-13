import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class question_TextFormField extends StatefulWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObsucre;
  int maxLines;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  question_TextFormField({
    required this.fieldName,
    this.maxLines = 1,
    required this.hintText,
    this.suffixIcon,
    this.isObsucre = false,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<question_TextFormField> createState() => _question_TextFormFieldState();
}

class _question_TextFormFieldState extends State<question_TextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldName,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManager.blackColor),
          ),
          TextFormField(
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: ColorManager.darkBlueColor),
            validator: widget.validator,
            maxLines: widget.maxLines,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isObsucre,
            decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.lightGreyColor,
                      width: AppSize.s1,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s8)),
                contentPadding:
                    EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                hintText: widget.hintText,
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
