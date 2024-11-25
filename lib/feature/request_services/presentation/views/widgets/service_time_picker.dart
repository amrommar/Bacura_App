import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class ServiceTimePicker extends StatelessWidget {
  const ServiceTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TimePickerSpinnerPopUp(
        mode: CupertinoDatePickerMode.date,
        initTime: DateTime.now(),
        minTime: DateTime.now().subtract(const Duration(seconds: 1)),
        maxTime: DateTime.now().add(const Duration(days: 10)),
        barrierColor: Colors.black12,
        //Barrier Color when pop up show
        minuteInterval: 1,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        cancelText: AppLocalizations.of(context)!.cancel,
        confirmText: AppLocalizations.of(context)!.ok,
        pressType: PressType.singlePress,
        timeFormat: 'dd/MM/yyyy',
        // Customize your time widget
        // timeWidgetBuilder: (dateTime) {},
        onChange: (dateTime) {
          // Implement your logic with select dateTime
        },
      ),
    );
  }
}
