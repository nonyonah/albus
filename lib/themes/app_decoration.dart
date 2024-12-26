import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get baseWhite => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimaryContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 8),
          ),
        ],
      );

  static BoxDecoration get brandBackground => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get brandBackgroundShadow => BoxDecoration(
        color: appTheme.gray5001,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimaryContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 8),
          ),
        ],
      );

  static BoxDecoration get brandColor => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get borderBrandColor => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray10002,
      );
  static BoxDecoration get fillCyan => BoxDecoration(
        color: appTheme.cyan600,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray20002.withOpacity(0.1),
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillGray20002 => BoxDecoration(
        color: appTheme.gray20002,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGrayF => BoxDecoration(
        color: appTheme.gray100F6,
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA700.withOpacity(0.2),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow900,
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.black900.withOpacity(0.3),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray20001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.gray5002,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder24 => BorderRadius.circular(24.h);
  static BorderRadius get circleBorder40 => BorderRadius.circular(40.h);
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
        top: Radius.circular(24.h),
      );
  static BorderRadius get roundedBorder10 => BorderRadius.circular(10.h);
  static BorderRadius get roundedBorder52 => BorderRadius.circular(52.h);
}
