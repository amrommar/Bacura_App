import 'package:bacura_app/core/utils/index.dart';

class PaymentOperationContainer extends StatefulWidget {
  const PaymentOperationContainer({super.key});

  @override
  State<PaymentOperationContainer> createState() => _PaymentOperationContainerState();
}

class _PaymentOperationContainerState extends State<PaymentOperationContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorManager.midBlueColor,
            borderRadius: BorderRadius.circular(AppSize.s8),
            boxShadow: [
              BoxShadow(color: ColorManager.midWhiteColor, spreadRadius: 2, blurRadius: 4, offset: const Offset(0, 3))
            ]),
        margin: EdgeInsets.only(right: 12.w, top: 12.h, left: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        height: 170.h,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////  Request Number and Time and Date section/////////////////////////////////////////////
              const PaymentOperationRow(),
              SizedBox(height: 10.h),
              ////service type section/////////////////////////////////////////////
              SizedBox(
                width: 400.w,
                child: Text('كاميرا IP خارجية 8 ميجابكسل 80 متر - هيكفيجن كاميرا IP خارجية 8 ميجابكسل 80 متر - هيكفيجن',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.lightBlueColor,
                        )),
              ),
              SizedBox(height: 10.h),
              ////  money and payment method section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('1000 ريال',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold)),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('بطاقة إئتمان',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.whiteColor,
                            )),
                  ),
                  Icon(Icons.monetization_on_outlined, color: ColorManager.lightBlueColor, size: 20)
                ])
              ])
            ]));
  }
}
