import 'package:bacura_app/core/utils/index.dart';

class OrderTimeDateWidget extends StatelessWidget {
  final String time;
  final String date;

  const OrderTimeDateWidget({
    super.key,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_month_outlined,
              color: ColorManager.primaryBlueColor,
              size: AppSizes.ph20,
            ),
            SizedBox(width: AppSizes.ph5),
            Text(date,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.greyColor,
                    )),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.access_time_outlined,
              color: ColorManager.primaryBlueColor,
              size: AppSizes.ph20,
            ),
            SizedBox(width: AppSizes.pw2),
            Text(
              time,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
