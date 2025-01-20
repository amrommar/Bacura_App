import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityDropDownWidget extends StatefulWidget {
  String selectedOption;
  final List<String> options;
  final Function(String?) onChanged;

  CityDropDownWidget({
    super.key,
    required this.selectedOption,
    required this.options,
    required this.onChanged,
  });

  @override
  State<CityDropDownWidget> createState() => _CityDropDownWidgetState();
}

class _CityDropDownWidgetState extends State<CityDropDownWidget> {
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
