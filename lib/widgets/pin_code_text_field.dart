import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField(
    {super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator}
  );

  final BuildContext context;
  Function(String) onChanged;
  final Alignment? alignment;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
    ? Align(
      alignment: alignment ?? Alignment.center,
      child: pinCodeTextFieldWidget,
    )
    : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
    appContext: context,
    controller: controller,
    length: 4,
    keyboardType: TextInputType.number,
    textStyle: textStyle,
    hintStyle: hintStyle,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    enableActiveFill: true,
    pinTheme: PinTheme(
      fieldHeight: 1.h,
      fieldWidth: 38.h,
      shape: PinCodeFieldShape.underline,
      inactiveFillColor: appTheme.black900,
      activeFillColor: appTheme.black900,
      inactiveColor: Colors.transparent,
      activeColor: Colors.transparent,
      selectedColor: Colors.transparent,
      selectedFillColor: appTheme.black900,
    ),
    onChanged: (value) => onChanged(value),
    validator: validator,
  );
}