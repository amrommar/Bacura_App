import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/color_manager.dart';

class DropDown_Field extends StatefulWidget {
  String selectedOption;
  List<String> options;
  String fieldName;

  DropDown_Field(
      {required this.selectedOption,
      required this.options,
      required this.fieldName});

  @override
  State<DropDown_Field> createState() => _DropDown_FieldState();
}

class _DropDown_FieldState extends State<DropDown_Field> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
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
          SingleChildScrollView(
            child: DropdownButtonFormField<String>(
              value: widget.selectedOption,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.blue),
              // Text style for selected option
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.greyColor,
                      width: AppSize.s1,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s8)),
              ),
              dropdownColor: ColorManager.whiteColor,

              // Background color of the dropdown list
              items: widget.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager
                            .darkBlueColor), // Text style for dropdown items
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.selectedOption = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
