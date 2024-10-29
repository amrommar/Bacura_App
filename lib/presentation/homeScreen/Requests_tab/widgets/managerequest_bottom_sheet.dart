import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageRequest_Bottom_Sheet extends StatefulWidget {
  @override
  State<ManageRequest_Bottom_Sheet> createState() => _ManageRequest_Bottom_SheetState();
}

class _ManageRequest_Bottom_SheetState extends State<ManageRequest_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              /// Cancel Request Button ////////////////////////////////////////
              Custom_Row_Manage_Request(
                  onTap: () {},
                  text: AppLocalizations.of(context)!.cancel_request,
                  icon: Icons.cancel,
                  iconColor: ColorManager.darkRedColor),
              Divider(),

              /// Close the order Button ///////////////////////////////////////
              /// this is to make the order completed ////////////////////////////////
              Custom_Row_Manage_Request(
                onTap: () {},
                text: AppLocalizations.of(context)!.close_the_order,
                icon: Icons.lock,
                iconColor: ColorManager.primaryBlueColor,
              ),
              Divider(),

              /// navigate PoP Button ///////////////////////////////////////
              Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_circle_down_outlined,
                        color: ColorManager.greyColor,
                        size: 30,
                      )))
            ])));
  }
}

class Custom_Row_Manage_Request extends StatelessWidget {
  String text;
  IconData icon;
  Color iconColor;
  Function onTap;

  Custom_Row_Manage_Request({required this.text, required this.icon, required this.iconColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Text(text,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      ))),
          Icon(
            icon,
            size: 30,
            color: iconColor,
          )
        ]));
  }
}
