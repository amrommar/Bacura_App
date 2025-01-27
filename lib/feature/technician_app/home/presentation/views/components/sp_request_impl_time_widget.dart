import 'package:bacura_app/core/utils/index.dart';

class SpRequestImplTimeWidget extends StatelessWidget {
  const SpRequestImplTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: AppSizes.pw150,
          child: Text('وقت التنفيذ: ',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: ColorManager.blackColor,
                  )),
        ),
        ////Time and Date section/////////////////////////////////////////////
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
            Icons.calendar_month_outlined,
            color: ColorManager.primaryBlueColor,
            size: AppSizes.ph20,
          ),
          SizedBox(width: AppSizes.pw5),
          Text('9/10/2024',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  )),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
            Icons.access_time_outlined,
            color: ColorManager.primaryBlueColor,
            size: AppSizes.ph20,
          ),
          SizedBox(width: AppSizes.ph5),
          Text('10:35 ص',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  )),
        ]),
      ],
    );
  }
}
