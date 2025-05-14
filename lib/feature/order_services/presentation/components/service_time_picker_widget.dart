import 'package:bacura_app/core/utils/index.dart';
import 'package:flutter/cupertino.dart';

class ServiceTimePickerWidget extends StatelessWidget {
  final DateTime? initTime;
  final Function(DateTime)? onChange;

  const ServiceTimePickerWidget({super.key, this.initTime, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TimePickerSpinnerPopUp(
        cancelTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorManager.blackColor,
            ),
        confirmTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorManager.blackColor,
            ),
        textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorManager.blackColor,
            ),
        iconSize: AppSizes.ph22,
        mode: CupertinoDatePickerMode.date,
        initTime: initTime,
        minTime: initTime,
        maxTime: DateTime.now().add(const Duration(days: 10)),
        barrierColor: Colors.black12,
        minuteInterval: 1,
        padding: EdgeInsets.fromLTRB(
          AppSizes.pw12,
          AppSizes.ph10,
          AppSizes.pw12,
          AppSizes.ph10,
        ),
        cancelText: tr(AppStrings.cancel),
        confirmText: tr(AppStrings.ok),
        pressType: PressType.singlePress,
        timeFormat: 'yyyy-MM-dd',
        onChange: onChange,
      ),
    );
  }
}
