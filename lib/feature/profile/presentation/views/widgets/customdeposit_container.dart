import 'package:bacura_app/core/utils/index.dart';

class Customdeposit_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorManager.lightBlueColor,
            borderRadius: BorderRadius.circular(AppSize.s8),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.midWhiteColor,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3) // Offset in the x and y directions
                  )
            ]),
        margin: EdgeInsets.only(right: 12.w, top: 12.h, left: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        height: 100.h,
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
                      size: 20,
                    ),
                    SizedBox(width: 5.w),
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
                    size: 20,
                  ),
                  SizedBox(width: 2.w),
                  Text('10:35 ص',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          ))
                ])
              ]),
              SizedBox(height: 10.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('1000 ريال',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text('بطاقة ائتمانية',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.primaryBlueColor,
                            )),
                  ),
                  Icon(
                    Icons.monetization_on_outlined,
                    color: ColorManager.darkBlueColor,
                    size: 20,
                  )
                ])
              ])
            ]));
  }
}
