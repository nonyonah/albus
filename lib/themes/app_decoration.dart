import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get brandbackground => BoxDecoration(
    color: theme.colorScheme.onPrimary.withOpacity(1),
  );

  static BoxDecoration get brandcolor => BoxDecoration(
    color: theme.colorScheme.primary,
  );

  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray50,
  );

  static BoxDecoration get fillBluegray10001 => BoxDecoration(
    color: appTheme.blueGray10001,
  );

  static BoxDecoration get fillCyan => BoxDecoration(
    color: appTheme.cyan600,
  );

  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray500.withOpacity(0.97),
  );

  static BoxDecoration get fillGray100 => BoxDecoration(
    color: appTheme.gray100,
  );

  static BoxDecoration get fillGrayF => BoxDecoration(
    color:appTheme.gray100F6,
  );

  static BoxDecoration get fillLightBlue => BoxDecoration(
    color: appTheme.lightBlue400,
  );

  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );

  static BoxDecoration get fillRed => BoxDecoration(
    color: appTheme.red100,
  );

  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
    color: theme.colorScheme.secondaryContainer,
  );

  static BoxDecoration get outlineBlack => BoxDecoration(
    color: theme.colorScheme.primary,
    border: Border(
      bottom: BorderSide(
        color: appTheme.black900.withOpacity(0.2),
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlineBlack900 => BoxDecoration();
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder40 => BorderRadius.circular(
    150.h,
  );
  static BorderRadius get circleBorder16 => BorderRadius.circular(
    16.h,
  );
  static BorderRadius get circleBorder22 => BorderRadius.circular(
    22.h,
  );
  static BorderRadius get circleBorder8 => BorderRadius.circular(
    8.h,
  );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
    12.h,
  );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
    5.h,
  );
  static BorderRadius get roundedBorder52 => BorderRadius.circular(
    52.h,
  );
}