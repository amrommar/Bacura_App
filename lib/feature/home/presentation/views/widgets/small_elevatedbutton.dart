import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';

class SmallElevatedButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color? backgroundColor = ColorManager.primaryBlueColor;
  Color? textColor = ColorManager.whiteColor;

  SmallElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s30))),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
        ));
  }
}
