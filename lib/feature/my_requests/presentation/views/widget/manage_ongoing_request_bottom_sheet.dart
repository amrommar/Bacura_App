import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/index.dart';

class ManageOnGoingRequestBottomSheet extends StatefulWidget {
  const ManageOnGoingRequestBottomSheet({super.key});

  @override
  State<ManageOnGoingRequestBottomSheet> createState() => _ManageOnGoingRequestBottomSheetState();
}

class _ManageOnGoingRequestBottomSheetState extends State<ManageOnGoingRequestBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.ph200,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.br20),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw30, vertical: AppSizes.ph30),
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          /// Cancel Request Button ////////////////////////////////////////
          ManageRequestOptionWidget(onTap: () {}, text: AppLocalizations.of(context)!.cancel_request, icon: Icons.cancel, iconColor: ColorManager.darkRedColor),
          const Divider(),

          /// Close the order Button ///////////////////////////////////////
          /// this is to make the order completed ////////////////////////////////
          ManageRequestOptionWidget(
            onTap: () {},
            text: AppLocalizations.of(context)!.close_the_order,
            icon: Icons.lock,
            iconColor: ColorManager.primaryBlueColor,
          ),
          const Divider(),

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
