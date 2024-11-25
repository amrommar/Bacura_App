import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              maximumSize: Size(170.w, 70),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                AppSize.s8,
              ))),
          onPressed: () {
            Navigator.pushNamed(context, Routes.serviceDetailsRoute);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.next,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.arrow_circle_right_outlined, color: ColorManager.whiteColor)
            ],
          )),
    );
  }
}
