import 'package:bacura_app/core/utils/index.dart';

class InvoiceTimeDateWidget extends StatelessWidget {
  const InvoiceTimeDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ////Time and Date section/////////////////////////////////////////////
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          Icons.calendar_month_outlined,
          color: ColorManager.greyColor,
          size: AppSizes.ph20,
        ),
        SizedBox(width: AppSizes.pw5),
        Text('9/10/2024',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.primaryBlueColor,
                ))
      ]),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          Icons.access_time_outlined,
          color: ColorManager.greyColor,
          size: AppSizes.ph20,
        ),
        SizedBox(width: AppSizes.pw2),
        Text(
          '10:35 ص',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.primaryBlueColor,
              ),
        )
      ])
    ]);
  }
}
