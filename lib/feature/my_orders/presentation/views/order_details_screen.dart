import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/cancelled_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/completed_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/manage_ongoing_order_bottom_sheet.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/ongoing_order_bottom_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_components_list.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_num_contact_icon_widget.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/order_total_price_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as RequestDetailsArguments;
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
                    color: ColorManager.midWhiteColor,
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
                  OrderNumContactIconWidget(requestColor: ColorManager.yellowColor, requestNumber: '123456789'),
                  const Divider(),
                  const OrderTimeDateWidget(date: '10/10/2023', time: '10:00 AM'),
                  const OrderComponentsList(),
                  const OrderTotalPriceWidget(),
                  const Divider(),
                  OrderDetailsIconTextsRow(
                    title: AppLocalizations.of(context)!.location,
                    description: ' الرياض حي العارض شارع أسماء بنت مالك',
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
                      description: 'ساري',
                      icon: Icons.verified_user,
                      iconColor: ColorManager.midBlueColor),
                  const Divider(),
                  SizedBox(height: AppSizes.ph50),
                  manageRequestButtons(ColorManager.yellowColor),
                  SizedBox(height: AppSizes.ph20),
                ]))));
  }

  Widget manageRequestButtons(Color requestColor) {
    if (requestColor == ColorManager.yellowColor) {
      //////////           Request Management Elevated Button              //////////////////////////////////////////
      return OnGoingOrderBottomWidget(onPressed: () {
        showManageRequestBottomSheet();
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

  void showManageRequestBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ManageOnGoingOrderBottomSheet();
        });
  }
}
