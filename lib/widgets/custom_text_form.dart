import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineOnPrimary => OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.h),
    borderSide: BorderSide(
      color: theme.colorScheme.onPrimary,
      width: 1,
    ),
  );
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
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
    this.border,
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
  final InputBorder? border;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
          decoration: decoration,
          validator: validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? CustomTextStyle.titleMediumInterTightPrimary,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        contentPadding: contentPadding ?? EdgeInsets.all(14.h),
        isDense: true,
        fillColor: fillColor ?? appTheme.gray50,
        filled: filled,
        border: border ?? InputBorder.none,
        enabledBorder: border ?? InputBorder.none,
        focusedBorder: border ?? InputBorder.none,
      );
}
