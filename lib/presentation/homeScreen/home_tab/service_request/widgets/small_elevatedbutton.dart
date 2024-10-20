import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';

class SmallElevatedbutton extends StatelessWidget {
  String text;
  Function onTap;
  Color? backgroundColor = ColorManager.primaryBlueColor;
  Color? textColor = ColorManager.whiteColor;

  SmallElevatedbutton(
      {required this.text,
      required this.onTap,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s30))),
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: textColor, fontWeight: FontWeight.bold),
        ));
  }
}
