import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnGoingRequestManageButton extends StatelessWidget {
  Function() onPressed;

  OnGoingRequestManageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
              AppSize.s30,
            ))),
            onPressed: () {
              onPressed();
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.request_management,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.whiteColor,
                            fontWeight: FontWeight.bold,
                          )),
                  Icon(
                    Icons.arrow_circle_up_outlined,
                    color: ColorManager.whiteColor,
                  )
                ])));
  }
}
