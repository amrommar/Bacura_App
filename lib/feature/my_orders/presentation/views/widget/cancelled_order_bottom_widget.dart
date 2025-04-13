import 'package:bacura_app/core/utils/index.dart';

class CancelledOrderBottomWidget extends StatelessWidget {
  const CancelledOrderBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(tr(AppStrings.orderCancelled),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkRedColor,
                fontWeight: FontWeight.w500,
              )),
      SizedBox(height: AppSizes.ph10),
      Icon(
        Icons.cancel,
        color: ColorManager.darkRedColor,
        size: AppSizes.ph50,
      )
    ]);
  }
}
