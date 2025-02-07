import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/order_services_provider.dart';
import 'package:flutter/cupertino.dart';

class ServiceTimePickerWidget extends StatelessWidget {
  const ServiceTimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<orderServicesProvider>(
      builder: (context, provider, child) => SizedBox(
        width: double.infinity,
        child: TimePickerSpinnerPopUp(
          mode: CupertinoDatePickerMode.date,
          initTime: DateTime.now(),
          minTime: DateTime.now().subtract(const Duration(seconds: 1)),
          maxTime: DateTime.now().add(const Duration(days: 10)),
          barrierColor: Colors.black12,

          minuteInterval: 1,
          padding: EdgeInsets.fromLTRB(AppSizes.pw12, AppSizes.ph10, AppSizes.pw12, AppSizes.ph10),
          cancelText: AppLocalizations.of(context)!.cancel,
          confirmText: AppLocalizations.of(context)!.ok,
          pressType: PressType.singlePress,
          timeFormat: 'dd/MM/yyyy',
          // Customize your time widget
          // timeWidgetBuilder: (dateTime) {},
          onChange: (DateTime dateTime) {
            provider.onDateChanged(dateTime);
          },
        ),
      ),
    );
  }
}
