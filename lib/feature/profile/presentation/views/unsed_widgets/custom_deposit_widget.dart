import 'package:bacura_app/core/utils/index.dart';

class CustomDepositWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorManager.lightBlueColor,
            borderRadius: BorderRadius.circular(AppSizes.br8),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.midWhiteColor,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3) // Offset in the x and y directions
                  )
            ]),
        margin: EdgeInsets.only(right: AppSizes.pw12, top: AppSizes.ph12, left: AppSizes.pw12),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
        height: AppSizes.ph100,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////  Request Number and Time and Date section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ////Time and Date section/////////////////////////////////////////////
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: ColorManager.darkBlueColor,
                      size: AppSizes.ph20,
                    ),
                    SizedBox(width: AppSizes.pw5),
                    Text('9/10/2024',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorManager.primaryBlueColor,
                            )),
                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: ColorManager.darkBlueColor,
                    size: AppSizes.ph20,
                  ),
                  SizedBox(width: AppSizes.pw2),
                  Text('10:35 ص',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          ))
                ])
              ]),
              SizedBox(height: AppSizes.ph10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('1000 ريال',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.all(AppSizes.ph2),
                    child: Text('بطاقة ائتمانية',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.primaryBlueColor,
                            )),
                  ),
                  Icon(
                    Icons.monetization_on_outlined,
                    color: ColorManager.darkBlueColor,
                    size: AppSizes.ph20,
                  )
                ])
              ])
            ]));
  }
}
