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
        mode: CupertinoDatePickerMode.date,
        initTime: initTime,
        minTime: initTime,
        maxTime: DateTime.now().add(const Duration(days: 10)),
        barrierColor: Colors.black12,
        minuteInterval: 1,
        padding: EdgeInsets.fromLTRB(AppSizes.pw12, AppSizes.ph10, AppSizes.pw12, AppSizes.ph10),
        cancelText: AppLocalizations.of(context)!.cancel,
        confirmText: AppLocalizations.of(context)!.ok,
        pressType: PressType.singlePress,
        timeFormat: 'yyyy-MM-dd',
        onChange: onChange,
      ),
    );
  }
}
