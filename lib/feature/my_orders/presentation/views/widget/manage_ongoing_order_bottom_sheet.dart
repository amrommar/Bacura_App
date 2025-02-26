import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/presentation/views/widget/manage_order_option_widget.dart';

class ManageOnGoingOrderBottomSheet extends StatefulWidget {
  const ManageOnGoingOrderBottomSheet({super.key});

  @override
  State<ManageOnGoingOrderBottomSheet> createState() => _ManageOnGoingOrderBottomSheetState();
}

class _ManageOnGoingOrderBottomSheetState extends State<ManageOnGoingOrderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  onTap: () {},
                  text: AppLocalizations.of(context)!.cancel_request,
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
            ])));
  }
}
