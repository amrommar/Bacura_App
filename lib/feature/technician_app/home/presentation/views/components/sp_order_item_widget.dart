import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/home/controller/sp_orders_provider.dart';

class SPOrderItemWidget extends StatelessWidget {
  final int index;
  final void Function() onPressed;

  SPOrderItemWidget({super.key, required this.index, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<SpOrdersProvider>(
      builder: (context, provider, child) => Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(
              AppSizes.br8,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.soLightGreyColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        margin: EdgeInsets.only(right: AppSizes.pw10, top: AppSizes.ph24, left: AppSizes.pw10),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph8),
        height: AppSizes.ph160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الطلب رقم: ',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      ),
                ),
                Text(
                  '#${provider.myOrderEntity.myOrderDataEntity[index].id.toString()}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSizes.pw150,
                  child: Text(
                    'وقت التنفيذ: ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.blackColor,
                        ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: ColorManager.primaryBlueColor,
                      size: AppSizes.ph20,
                    ),
                    SizedBox(width: AppSizes.pw5),
                    Text(
                      provider.dateCreateOrder(index),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.greyColor,
                          ),
                    ),
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
                    SizedBox(width: AppSizes.ph5),
                    Text(
                      DateParser.dateFormatterOnlyTime(provider.dateCreateOrder(index)),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.greyColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                onPressed();
              },
              child: Text('تفاصيل الطلب',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorManager.whiteColor,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
