import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class CustomButtonStyles {
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    elevation: 0,
  );
  static ButtonStyle get fillGreenA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.greenA700.withOpacity(0.2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
    elevation: 0,
  );
  static ButtonStyle get fillGreenATL8 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.greenA700,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.h),
    ),
  );
  static ButtonStyle get fillLightBlue => ElevatedButton.styleFrom(
    backgroundColor: appTheme.lightBlue400,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.h),
    ),
    elevation: 0,
  );
  static ButtonStyle get fillPrimryTL10 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    elevation: 0,
  );
  static ButtonStyle get fillYellow => ElevatedButton.styleFrom(
    backgroundColor: appTheme.yellow900.withOpacity(0.2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
    elevation: 0,
  );
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(color: Colors.transparent),
    ),
  );
}
