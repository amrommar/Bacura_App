import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/index.dart';

class PaymentOperationWidget extends StatefulWidget {
  const PaymentOperationWidget({super.key});

  @override
  State<PaymentOperationWidget> createState() => _PaymentOperationWidgetState();
}

class _PaymentOperationWidgetState extends State<PaymentOperationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorManager.midBlueColor,
            borderRadius: BorderRadius.circular(AppSizes.br8),
            boxShadow: [
              BoxShadow(
                color: ColorManager.midWhiteColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        margin: EdgeInsets.only(
          right: AppSizes.pw12,
          top: AppSizes.ph12,
          left: AppSizes.pw12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw12,
          vertical: AppSizes.ph12,
        ),
        height: AppSizes.ph170,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////  Request Number and Time and Date section/////////////////////////////////////////////
              const PaymentOperationRow(),
              SizedBox(height: AppSizes.ph10),
              ////service type section/////////////////////////////////////////////
              SizedBox(
                width: AppSizes.pw400,
                child: Text('كاميرا IP خارجية 8 ميجابكسل 80 متر - هيكفيجن كاميرا IP خارجية 8 ميجابكسل 80 متر - هيكفيجن',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.lightBlueColor,
                        )),
              ),
              SizedBox(height: AppSizes.ph10),
              ////  money and payment method section/////////////////////////////////////////////
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('1000 ريال',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold)),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.all(AppSizes.ph2),
                    child: Text('بطاقة إئتمان',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.whiteColor,
                            )),
                  ),
                  Icon(
                    Icons.monetization_on_outlined,
                    color: ColorManager.lightBlueColor,
                    size: AppSizes.ph20,
                  )
                ])
              ])
            ]));
  }
}
