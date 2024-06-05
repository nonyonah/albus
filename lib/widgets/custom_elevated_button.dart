import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final EdgeInsets? margin;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final String text;

  const BaseButton({
    super.key,
    this.margin,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.alignment,
    required this.text,
  });
}

class CustomElevatedButton extends BaseButton {
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    super.alignment,
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildElevatedButtonWidget(),
          )
        : _buildElevatedButtonWidget();
  }

  Widget _buildElevatedButtonWidget() => Container(
        height: height ?? 52,
        width: width ?? double.infinity,
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
                style: buttonTextStyle ??
                    const TextStyle(
                      color: Colors.white, // Placeholder for CustomTextStyles.titleMediumInterTightWhiteA700
                    ),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
