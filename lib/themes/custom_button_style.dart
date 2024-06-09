import 'package:flutter/material.dart';
import 'package:myapp/core/utils/size_utils.dart';
import 'package:myapp/themes/theme_helper.dart';

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