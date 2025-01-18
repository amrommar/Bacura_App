import 'package:bacura_app/core/utils/index.dart';

class SpCompletedRequestTimeNumRow extends StatelessWidget {
  const SpCompletedRequestTimeNumRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '#3333452',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.darkBlueColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          Icons.calendar_month_outlined,
          color: ColorManager.primaryBlueColor,
          size: 20,
        ),
        SizedBox(width: 5.w),
        Text('9/10/2024',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ))
      ]),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          Icons.access_time_outlined,
          color: ColorManager.primaryBlueColor,
          size: 20,
        ),
        SizedBox(width: 2.w),
        Text('10:35 ص',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ))
      ])
    ]);
  }
}
