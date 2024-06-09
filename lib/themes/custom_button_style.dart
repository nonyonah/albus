import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';


class CustomButtonStyles {
  static ButtonStyle get fillPrimaryTL11 => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0)
  );
  static ButtonStyle get fillBlack => ElevatedButton.styleFrom(
    backgroundColor: appTheme.black900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26.h),
    ),
  );
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0)
  );
}