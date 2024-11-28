import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';

class CityDropDownField extends StatefulWidget {
  String selectedOption;
  List<String> options;

  CityDropDownField({
    required this.selectedOption,
    required this.options,
  });

  @override
  State<CityDropDownField> createState() => _CityDropDownFieldState();
}

class _CityDropDownFieldState extends State<CityDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: SingleChildScrollView(
            child: DropdownButtonFormField<String>(
                value: widget.selectedOption,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.blue,
                    ),
                // Text style for selected option
                decoration: InputDecoration(
                  hintText: 'City',
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
                ),
                dropdownColor: ColorManager.whiteColor,
                iconEnabledColor: ColorManager.primaryBlueColor,

                // Background color of the dropdown list
                items: widget.options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.darkBlueColor), // Text style for dropdown items
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.selectedOption = newValue!;
                  });
                })));
  }
}
