import 'package:bacura_app/core/presentation/images/custom_svg_image.dart';
import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/controller/calender_orders_provider.dart';

class SpCalenderRequestItemComponent extends StatelessWidget {
  final int index;
  const SpCalenderRequestItemComponent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalenderOrdersProvider>(
      builder: (context, provider, child) => Container(
        decoration: BoxDecoration(
          color: ColorManager.primaryBlueColor,
          borderRadius: BorderRadius.circular(AppSizes.br16),
        ),
        margin: EdgeInsets.only(right: AppSizes.pw36, top: AppSizes.ph12, left: AppSizes.pw36, bottom: AppSizes.ph12),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw10, vertical: AppSizes.ph10),
        // height: AppSizes.ph100,
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppSizes.ph6),
                    child: CustomSvgImage.square(
                      size: AppSizes.ph40,
                      path: 'assets/images/svg/cameraicon.svg',
                      color: ColorManager.whiteColor,
                    ),
                  ),
                  VerticalDivider(color: ColorManager.lightBlueColor, thickness: 0.5),
                  SizedBox(width: AppSizes.pw5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(provider.orders[index].service!.name,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorManager.whiteColor)),
                      SizedBox(height: 3.h),
                      Text(DateParser.dateFormatterOnlyTime(provider.orders[index].installationDate!),
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.whiteColor)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: AppSizes.ph5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: AppSizes.ph20),
                Icon(Icons.location_on, color: ColorManager.lightBlueColor, size: AppSizes.ph22),
                SizedBox(width: AppSizes.ph5),
                Expanded(
                  child: Text(provider.orders[index].location!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.lightBlueColor)),
                ),
                SizedBox(width: AppSizes.ph10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
