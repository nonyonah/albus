import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/widgets/base_button.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton(
      {super.key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      super.margin,
      super.onPressed,
      super.buttonStyle,
      super.alignment,
      super.buttonTextStyle,
      super.isDisabled,
      super.height,
      super.width,
      required super.text});

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget)
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 52.h,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: 
                buttonTextStyle ?? CustomTextStyles.titleMediumWhiteA70017,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
