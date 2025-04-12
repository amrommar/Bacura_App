import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomDialog extends AlertDialog {
  CustomDialog({
    super.key,
    required BuildContext context,
    double? width,
    double? height,
    String? image,
    required Function onPressed,
    Function? onPressed2,
    String? title,
    String? message,
    String? buttonText,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    String description = '',
    List<Widget>? actions,
    EdgeInsets? insetPadding,
    EdgeInsets? contentPadding,
    Clip clipBehavior = Clip.none,
    super.shape,
    Widget? child,
    Color? backgroundColor,
  }) : super(
          contentPadding: contentPadding,
          backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
          elevation: AppSizes.e1,
          insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: AppSizes.pw12),
          content: child ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: AppSizes.pw12,
                  ),
                  if (title != null)
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: AppSizes.sp20, height: AppSizes.ph1_2),
                    ),
                  SizedBox(
                    height: AppSizes.ph25,
                  ),
                  if (message != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw32),
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: AppSizes.sp16),
                      ),
                    ),
                  if (message != null)
                    SizedBox(
                      height: AppSizes.ph14,
                    ),
                  child ?? const SizedBox(),
                  if (actions != null) ...List.generate(actions.length, (index) => actions[index]),
                  if (actions == null)
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: onPressed(),
                            child: Text(
                              buttonText ?? AppStrings.ok,
                              style: Theme.of(context).textTheme.titleMedium,
                            )))
                ],
              ),
        );
}
