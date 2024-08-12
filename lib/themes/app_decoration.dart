import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/cupertino.dart';

class AppDecoration {
  static BoxDecoration get brandBackground => BoxDecoration(
    color: appTheme.whiteA700 
  );
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(
      color: appTheme.black900.withOpacity(0.1),
      width: 1.h,
    ),
  );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder40 => BorderRadius.circular(
    40.h,
  );
}