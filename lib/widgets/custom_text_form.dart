import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.boxDecoration,
    this.border,
    this.borderRadius,
    this.fillColor,
    this.filled = false,
    this.validator,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;
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
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _textFormFieldWidget,
          )
        : _textFormFieldWidget;
  }

  Widget get _textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: Container(
          decoration: boxDecoration ??
              BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(24.h),
                color: appTheme.gray50.withOpacity(1),
              ),
          child: TextFormField(
            scrollPadding: scrollPadding ??
                EdgeInsets.only(
                  bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
                ),
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
            style: textStyle ?? CustomTextStyle.titleMediumInterTightPrimary,
            obscureText: obscureText,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            maxLines: maxLines ?? 1,
            decoration: _decoration,
            validator: validator,
          ),
        ),
      );

  InputDecoration get _decoration => InputDecoration(
        hintText: hintText ?? '',
        hintStyle: hintStyle ?? CustomTextStyle.titleMediumInterTightPrimary,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        contentPadding: contentPadding ?? EdgeInsets.all(14.h),
        isDense: true,
        fillColor: fillColor ?? Colors.grey.withOpacity(0.05),
        filled: filled,
        border: border ?? borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.h),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.10)),
            ),
      );
}
