import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeNumberRow extends StatelessWidget {
  const ChangeNumberRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      //// from Back-End ////////////////////////
      Text('+966 ****** 965', style: Theme.of(context).textTheme.displayMedium),
      SizedBox(width: 20.w),
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          AppLocalizations.of(context)!.changeNumber,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: ColorManager.primaryBlueColor,
              ),
        ),
      )
    ]);
  }
}
