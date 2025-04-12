import 'package:bacura_app/core/presentation/widget/custom_dialog.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class DialogWidget {
  static Future showCustomDialog({
    required BuildContext context,
    String? title,
    String? message,
    String? buttonText,
    Function? onPressed,
    String? image,
    Widget? footer,
    bool withOutIconButton = false,
    String description = '',
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? titleColor,
    Color? barrierColor,
    EdgeInsets? contentPadding,
    EdgeInsets? insetPadding,
    Widget? child,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) async {
    if (context.mounted) {
      return await showGeneralDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          barrierLabel: '',
          transitionBuilder: (context, a1, a2, widget) => Transform.scale(
                scale: a1.value,
                child: WillPopScope(
                  onWillPop: () => Future.value(barrierDismissible),
                  child: Opacity(
                    opacity: a1.value,
                    child: CustomDialog(
                      insetPadding: insetPadding,
                      contentPadding: contentPadding,
                      backgroundColor: backgroundColor,
                      context: context,
                      title: title,
                      actions: actions,
                      image: image,
                      onPressed: onPressed ?? () => Navigator.pop(context),
                      message: message,
                      description: description,
                      buttonText: buttonText,
                      shape: shape ??
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.br4),
                          ),
                      child: child,
                    ),
                  ),
                ),
              ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const SizedBox());
    }
  }
}
