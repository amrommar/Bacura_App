import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendOtpAgain extends StatelessWidget {
  const ResendOtpAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.sendOTPAgain,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 20.w),
        Text(
          '60',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.greyColor,
              ),
        )
      ],
    );
  }
}
