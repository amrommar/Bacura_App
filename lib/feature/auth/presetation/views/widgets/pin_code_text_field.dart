import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  Function(dynamic) onChanged;

  CustomPinCodeTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PinCodeTextField(
          textStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.primaryBlueColor, fontSize: 28),
          appContext: context,
          length: 4,
          onChanged: (value) {
            onChanged(value);
          },
          enablePinAutofill: true,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              inactiveColor: ColorManager.darkBlueColor,
              activeColor: ColorManager.primaryBlueColor,
              selectedColor: ColorManager.darkBlueColor,
              errorBorderColor: ColorManager.redColor,
              inActiveBoxShadow: [BoxShadow(color: ColorManager.midWhiteColor)],
              activeBoxShadow: [BoxShadow(color: ColorManager.midWhiteColor)],
              borderWidth: 1.5,
              fieldOuterPadding: EdgeInsets.all(12),
              activeBorderWidth: 1.5,
              disabledBorderWidth: 1.5,
              inactiveBorderWidth: 1.5,
              errorBorderWidth: 1.5,
              selectedBorderWidth: 2,
              fieldHeight: 50,
              fieldWidth: 50,
              activeFillColor: ColorManager.lightRedColor,
              inactiveFillColor: Colors.yellow,
              selectedFillColor: Colors.green),
          keyboardType: TextInputType.number),
    );
  }
}
