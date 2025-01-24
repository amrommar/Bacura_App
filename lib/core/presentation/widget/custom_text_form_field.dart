import 'package:bacura_app/core/extenstions/string_extentions.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.keyTextField,
    this.readonly = false,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.textDirection,
    this.onChanged,
    this.enabled,
    this.onFieldSubmitted,
    this.labelText,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.prefixOnPressed,
    this.suffixOnPressed,
    this.validator,
    this.colorSuffixIcon,
    this.fillColor,
    this.initialValue,
    this.onFocusChange,
    this.focusFromStart = false,
    this.withoutFocusBorder = false,
    this.suffix,
    this.outlineInputBorder,
    this.borderRadius,
    this.labelStyle,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final String? keyTextField;
  final bool readonly;
  final bool obscureText;
  final Color? colorSuffixIcon;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool focusFromStart;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? prefixOnPressed;
  final void Function()? suffixOnPressed;
  final String? Function(String?)? validator;

  final void Function(bool)? onFocusChange;
  final bool withoutFocusBorder;
  final Widget? suffix;
  final OutlineInputBorder? outlineInputBorder;
  final BorderRadius? borderRadius;
  final TextStyle? labelStyle;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focusNode = FocusNode();
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusFromStart) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(focusNode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) {
        setState(() {});
        if (widget.onFocusChange != null) widget.onFocusChange!(focus);
      },
      child: TextFormField(
          initialValue: widget.initialValue,
          readOnly: widget.readonly,
          controller: widget.controller,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: (value) {
            setState(() {
              hasError = widget.validator!(value) != null;
            });
            return widget.validator!(value);
          },
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: AppSizes.sp16,
                fontWeight: FontWeightManager.medium,
              ),
          textDirection: widget.textDirection,
          inputFormatters: widget.inputFormatters,
          onChanged: (value) {
            if (widget.controller != null) {
              TextPosition position = widget.controller!.selection.extent;
              widget.controller!.text = widget.controller!.text.toEnglishDigits();
              widget.controller!.selection = TextSelection.fromPosition(
                position,
              );
            }
            if (widget.onChanged != null) widget.onChanged!(value);
          },
          enabled: widget.enabled,
          focusNode: focusNode,
          maxLength: widget.maxLength,
          cursorColor: Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide.color,
          onFieldSubmitted: widget.onFieldSubmitted,
          obscureText: widget.obscureText,
          key: ValueKey(widget.keyTextField),
          decoration: (const InputDecoration()).applyDefaults(Theme.of(context).inputDecorationTheme).copyWith(
                counterText: "",
                counterStyle: const TextStyle(
                  height: double.minPositive,
                ),
                fillColor: widget.fillColor ?? Theme.of(context).inputDecorationTheme.fillColor,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSizes.pw16,
                  vertical: AppSizes.ph12,
                ),
                focusedBorder: !widget.withoutFocusBorder
                    ? Theme.of(context).inputDecorationTheme.focusedBorder
                    : widget.outlineInputBorder ??
                        OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSizes.br16),
                        ),
                enabledBorder: !widget.withoutFocusBorder
                    ? Theme.of(context).inputDecorationTheme.enabledBorder
                    : widget.outlineInputBorder ??
                        OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSizes.br16),
                        ),
                errorBorder: !widget.withoutFocusBorder
                    ? Theme.of(context).inputDecorationTheme.errorBorder
                    : widget.outlineInputBorder ??
                        OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSizes.br16),
                        ),
                border: !widget.withoutFocusBorder
                    ? Theme.of(context).inputDecorationTheme.border
                    : widget.outlineInputBorder ??
                        OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSizes.br16),
                        ),
                focusedErrorBorder: !widget.withoutFocusBorder
                    ? Theme.of(context).inputDecorationTheme.focusedErrorBorder
                    : widget.outlineInputBorder ??
                        OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSizes.br16),
                        ),
                hintText: widget.hintText ?? "",
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                labelText: widget.labelText,
                labelStyle: widget.labelStyle ?? Theme.of(context).inputDecorationTheme.labelStyle,
                floatingLabelStyle: hasError
                    ? Theme.of(context).inputDecorationTheme.errorStyle!.copyWith(fontSize: AppSizes.sp14)
                    : focusNode.hasFocus
                        ? Theme.of(context).inputDecorationTheme.floatingLabelStyle!.copyWith(fontSize: AppSizes.sp14)
                        : Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(fontSize: AppSizes.sp14),
                errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
                disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
              )),
    );
  }
}
