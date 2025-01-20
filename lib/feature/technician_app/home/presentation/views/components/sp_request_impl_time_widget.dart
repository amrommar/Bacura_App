import 'package:bacura_app/core/utils/index.dart';

class SpRequestImplTimeWidget extends StatelessWidget {
  const SpRequestImplTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150.w,
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
            size: 20,
          ),
          SizedBox(width: 5.w),
          Text('9/10/2024',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  )),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
            Icons.access_time_outlined,
            color: ColorManager.primaryBlueColor,
            size: 20,
          ),
          SizedBox(width: 5.w),
          Text('10:35 ص',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  )),
        ]),
      ],
    );
  }
}
