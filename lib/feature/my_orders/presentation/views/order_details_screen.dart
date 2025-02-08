import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/cancelled_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/completed_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/manage_ongoing_order_bottom_sheet.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/ongoing_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_components_list.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_num_contact_icon_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String? orderId;
  final String? date;
  final String? time;
  final Color? requestColor;
  final String? location;
  final String? expiresAt;
  final int? total;

  const OrderDetailsScreen(
      {super.key, this.orderId, this.date, this.time, this.requestColor, this.location, this.expiresAt, this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.request_details,
      )),
      body: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.br12),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightBlueColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        margin: EdgeInsets.symmetric(horizontal: AppSizes.ph12, vertical: AppSizes.ph12),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.ph12, vertical: AppSizes.ph12),
        height: AppSizes.ph800,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OrderNumContactIconWidget(
                  requestColor: requestColor ?? ColorManager.yellowColor, requestNumber: orderId ?? ''),
              const Divider(),
              OrderTimeDateWidget(date: date ?? '10/10/2010', time: time ?? '10:10'),
              Container(
                padding: EdgeInsets.all(AppSizes.ph15),
                margin: EdgeInsets.symmetric(vertical: AppSizes.ph12),
                decoration: BoxDecoration(
                  color: ColorManager.lightBlueColor,
                  borderRadius: BorderRadius.circular(AppSizes.br8),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                            child: Text('كاميرا IP خارجية 8MP 80m - كاميرا IP خارجية Hikvision 8MP 80m',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: ColorManager.blackColor,
                                    ))),
                        Text('1000 ريال',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: ColorManager.darkRedColor,
                                ))
                      ]),
                    ]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: ColorManager.whiteColor,
                    );
                  },
                  itemCount: 4,
                ),
              ),
              if (total! > 0)
                Container(
                  padding: EdgeInsets.only(
                    left: AppSizes.pw8,
                    right: AppSizes.pw8,
                    top: AppSizes.ph8,
                  ),
                  height: 40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.total,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.darkBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${NumberParser.translateNumber((total).toString())} ريال',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.primaryBlueColor,
                            ),
                      ),
                    ],
                  ),
                ),
              const Divider(),
              OrderDetailsIconTextsRow(
                title: AppLocalizations.of(context)!.location,
                description: location ?? '',
                icon: Icons.location_on,
              ),
              OrderDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.payment_method,
                  description: 'بطاقة إئتمانية',
                  icon: Icons.credit_card,
                  iconColor: ColorManager.greyColor),
              OrderDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.payment_status,
                  description: 'تم الدفع',
                  icon: Icons.check_circle,
                  iconColor: ColorManager.darkGreenColor),
              OrderDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.warranty_status,
                  description: expiresAt ?? '',
                  icon: Icons.verified_user,
                  iconColor: ColorManager.midBlueColor),
              const Divider(),
              SizedBox(height: AppSizes.ph50),
              manageRequestButtons(ColorManager.yellowColor, context: context),
              SizedBox(height: AppSizes.ph20),
            ],
          ),
        ),
      ),
    );
  }

  Widget manageRequestButtons(Color requestColor, {required BuildContext context}) {
    if (requestColor == ColorManager.yellowColor) {
      //////////           Request Management Elevated Button              //////////////////////////////////////////
      return OnGoingOrderBottomWidget(onPressed: () {
        showManageRequestBottomSheet(context);
      });
    } else if (requestColor == ColorManager.redColor) {
      //////////           Request Cancelled icon and text             //////////////////////////////////////////
      return const CancelledOrderBottomWidget();
    } else if (requestColor == ColorManager.greenColor) {
      //////////          Completed Request button and text             //////////////////////////////////////////
      return const CompletedOrderBottomWidget();
    }
    return Container();
  }

  void showManageRequestBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ManageOnGoingOrderBottomSheet();
        });
  }
}
