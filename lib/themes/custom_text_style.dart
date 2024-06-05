import 'package:flutter/material.dart';
import 'package:myapp/core/utils/size_utils.dart';
import 'package:myapp/themes/theme_helper.dart';

extension on TextStyle {
  TextStyle get interTight {
    return copyWith(
      fontFamily: 'InterTight',
    );
  }
}

class CustomTextStyle {
  static get bodyMediumInterTightOnPrimaryContainer => 
  theme.textTheme.bodyMedium!.interTight.copyWith(
    color: theme.colorScheme.onPrimaryContainer,
    fontSize: 14.fSize,
  );

  static get titleMediumInterTightWhiteA700 => 
  theme.textTheme.titleMedium!.interTight.copyWith(
    color: appTheme.whiteA700,
    fontSize: 17.fSize,
  );
}