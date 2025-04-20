import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/controller/my_order_provider.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/manage_order_option_widget.dart';

class ManageApprovedOrderBottomSheet extends StatelessWidget {
  final int index;

  const ManageApprovedOrderBottomSheet({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderProvider(),
      child: Consumer<MyOrderProvider>(
        builder: (context, provider, child) => Container(
            height: AppSizes.ph150,
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(AppSizes.br20),
            ),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw30, vertical: AppSizes.ph30),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  /// Cancel Request Button ////////////////////////////////////////
                  ManageOrderOptionWidget(
                      onTap: () {
                        provider.cancelOrder(context: context, index: index);
                      },
                      text: tr(AppStrings.cancelOrder),
                      icon: Icons.cancel,
                      iconColor: ColorManager.darkRedColor),
                  const Divider(),

                  /// Close the order Button ///////////////////////////////////////
                  /// this is to make the order completed ////////////////////////////////

                  /// navigate PoP Button ///////////////////////////////////////
                  Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_circle_down_outlined,
                            color: ColorManager.greyColor,
                            size: AppSizes.ph30,
                          )))
                ]))),
      ),
    );
  }
}
