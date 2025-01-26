import 'package:bacura_app/core/utils/index.dart';

class PaymentOperationRow extends StatelessWidget {
  const PaymentOperationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ////  Request Number  section/////////////////////////////////////////////
      Text('#3333452',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.whiteColor,
                fontWeight: FontWeight.bold,
              )),
      ////Time and Date section/////////////////////////////////////////////
      Row(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
            Icons.calendar_month_outlined,
            color: ColorManager.lightBlueColor,
            size: AppSizes.ph20,
          ),
          SizedBox(width: AppSizes.pw5),
          Text('9/10/2024',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.whiteColor,
                  ))
        ]),
        SizedBox(width: AppSizes.pw10),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.access_time_outlined, color: ColorManager.lightBlueColor, size: AppSizes.ph20),
          SizedBox(width: AppSizes.pw2),
          Text('10:35 ص',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.whiteColor,
                  ))
        ])
      ])
    ]);
  }
}
