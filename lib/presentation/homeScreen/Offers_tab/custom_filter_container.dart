import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class Custom_Filter_Container extends StatelessWidget {
  Widget child;

  Custom_Filter_Container({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(AppPadding.p4),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGreyColor,
                // Shadow color with opacity
                spreadRadius: 0,
                // Spread radius
                blurRadius: 1,
                // Blur radius
                offset: Offset(0, 1), // Offset in the x and y directions
              ),
            ],
            color: ColorManager.lightBlueColor,
            borderRadius: BorderRadius.circular(AppSize.s4)),
        child: child);
  }
}
