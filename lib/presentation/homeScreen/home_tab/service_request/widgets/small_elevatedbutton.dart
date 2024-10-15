import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';

class SmallElevatedbutton extends StatelessWidget {
  String text;
  Function onTap;

  SmallElevatedbutton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s30))),
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.whiteColor, fontWeight: FontWeight.bold),
        ));
  }
}
