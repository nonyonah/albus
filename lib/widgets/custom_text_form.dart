import 'package:flutter/material.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.inputHeight,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.decoration,
    this.boxDecoration,
    this.border,
    this.borderRadius,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onTap, String? errorText, String? suffixText,
  });

  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool readOnly;
  final TextStyle? textStyle;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final InputBorder? border;
  final BorderRadius? borderRadius;
  final BoxDecoration? boxDecoration;
  final InputDecoration? decoration;
  final Color? fillColor;
  final double? inputHeight;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _textFormFieldWidget(context),
          )
        : _textFormFieldWidget(context);
  }

  Widget _textFormFieldWidget(BuildContext context) => Container(
        width: width ?? double.maxFinite,
        height: 60.h,
        decoration: boxDecoration ??
            BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(10.h),
              color: appTheme.gray50.withOpacity(1),
            ),
        child: TextFormField(
          scrollPadding: scrollPadding ??
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autoFocus,
          style: textStyle ?? theme.textTheme.titleSmall,
          obscureText: obscureText,
          readOnly: readOnly,
          onTap: onTap,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration ?? _decoration,
          validator: validator,
        ),
      );

  InputDecoration get _decoration => InputDecoration(
        hintText: hintText ?? '',
        hintStyle: hintStyle ?? CustomTextStyles.bodyMediumBlack900,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 64.h, horizontal: 15.h),
        isDense: true,
        fillColor: fillColor ?? Colors.grey.withOpacity(0.05),
        filled: filled,
        border: border ??
            borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.10)),
            ),
      );
}
