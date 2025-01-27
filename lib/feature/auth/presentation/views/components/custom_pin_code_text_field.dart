import 'package:bacura_app/core/utils/index.dart';

class CustomPinCodeTextField extends StatelessWidget {
  Function(dynamic) onChanged;

  CustomPinCodeTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.h),
      child: PinCodeTextField(
          textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: ColorManager.primaryBlueColor,
                fontSize: AppSizes.sp32,
              ),
          appContext: context,
          length: 4,
          onChanged: (value) {
            onChanged(value);
          },
          enablePinAutofill: true,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(AppSizes.br4),
              inactiveColor: ColorManager.darkBlueColor,
              activeColor: ColorManager.primaryBlueColor,
              selectedColor: ColorManager.darkBlueColor,
              errorBorderColor: ColorManager.redColor,
              inActiveBoxShadow: [BoxShadow(color: ColorManager.midWhiteColor)],
              activeBoxShadow: [BoxShadow(color: ColorManager.midWhiteColor)],
              borderWidth: 1.5,
              fieldOuterPadding: EdgeInsets.all(AppSizes.pw12),
              activeBorderWidth: 1.5,
              disabledBorderWidth: 1.5,
              inactiveBorderWidth: 1.5,
              errorBorderWidth: 1.5,
              selectedBorderWidth: 2,
              fieldHeight: AppSizes.ph30,
              fieldWidth: AppSizes.pw30,
              activeFillColor: ColorManager.lightRedColor,
              inactiveFillColor: Colors.yellow,
              selectedFillColor: Colors.green),
          keyboardType: TextInputType.number),
    );
  }
}
