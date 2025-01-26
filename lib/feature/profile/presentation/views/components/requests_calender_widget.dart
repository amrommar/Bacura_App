import 'package:bacura_app/core/utils/index.dart';

class RequestsCalenderWidget extends StatelessWidget {
  const RequestsCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.calenderRoute);
        },
        child: CustomShadowWidget(
            childWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: ColorManager.midBlueColor,
                ),
                SizedBox(width: AppSizes.ph10),
                Text('التقويم',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                        ))
              ]),
              SizedBox(width: AppSizes.pw10),
              Icon(
                Icons.navigate_next_rounded,
                size: AppSizes.ph28,
                color: ColorManager.darkBlueColor,
              )
            ])));
  }
}
