import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestTotalPriceWidget extends StatelessWidget {
  const RequestTotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
          top: 8.h,
        ),
        height: 40.h,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(AppLocalizations.of(context)!.total,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
          Text('2000 ريال',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryBlueColor,
                  ))
        ]));
  }
}
