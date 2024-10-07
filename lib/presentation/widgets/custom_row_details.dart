import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomRow_Details extends StatelessWidget {
  IconData icon;
  String text;
  String value;

  CustomRow_Details({
    required this.icon,
    required this.text,
    required this.value,
  });

  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorManager.primaryBlueColor,
          size: 30,
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor, fontWeight: FontWeight.w600),
            ),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.greyColor),
            ),
          ],
        ),
        Spacer(),
        Text(
          AppStrings.edit,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
