import 'package:bacura_app/core/presentation/images/custom_svg_image.dart';
import 'package:bacura_app/core/presentation/widget/custom_loading_indicators.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isEnabled = true,
    this.isLoading = false,
    this.iconAsset,
    this.textStyle,
    this.isErrorButton = false,
    this.padding,
  });

  final bool isEnabled;
  final Function onPressed;
  final String text;
  final bool isLoading;
  final String? iconAsset;
  final bool isErrorButton;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && !isLoading
          ? () {
              onPressed.call();
            }
          : null,
      style: isEnabled
          ? Theme.of(context).elevatedButtonTheme.style
          : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Theme.of(context).disabledColor,
                ),
              ),
      child: SizedBox(
        height: isTablet() ? AppSizes.ph48 : AppSizes.ph52,
        child: Ink(
          decoration: BoxDecoration(
            color: isErrorButton ? Theme.of(context).colorScheme.error : null,
            borderRadius: BorderRadius.circular(AppSizes.br24),
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: AppSizes.ph43),
            padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.pw18),
            alignment: Alignment.center,
            child: isLoading
                ? CustomLoadingIndicators.defaultLoading(
                    color: Theme.of(context).colorScheme.surface,
                    size: AppSizes.ph15,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (iconAsset != null)
                        Row(
                          children: [
                            CustomSvgImage.icons(path: iconAsset!),
                            SizedBox(
                              width: AppSizes.pw16,
                            )
                          ],
                        ),
                      Text(
                        text,
                        style: isEnabled
                            ? textStyle ?? Theme.of(context).elevatedButtonTheme.style!.textStyle!.resolve({WidgetState.pressed})
                            : Theme.of(context).elevatedButtonTheme.style!.textStyle!.resolve({WidgetState.pressed})?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
