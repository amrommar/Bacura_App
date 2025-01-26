import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomModalBottomSheet {
  static Future<dynamic> showModalBottomSheet({
    required BuildContext context,
    required Widget body,
    bool isDismissible = true,
    ShapeBorder? shape,
    bool expand = false,
    bool enableDrag = false,
    double? elevation,
    Color? backgroundColor,
    Color? barrierColor,
    Curve? animationCurve,
    double? height,
  }) async {
    return await showMaterialModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.br4),
              topRight: Radius.circular(AppSizes.br4),
            ),
          ),
      duration: const Duration(milliseconds: 200),
      expand: expand,
      enableDrag: enableDrag,
      elevation: elevation,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      barrierColor: barrierColor,
      animationCurve: animationCurve,
      builder: (context) {
        return SizedBox(
            height: (height ?? 0) + (MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: body),
              ],
            ));
      },
    );
  }
}
