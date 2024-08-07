import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension on TextStyle {
  TextStyle get outfit {
    return copyWith(
      fontFamily: GoogleFonts.interTight().fontFamily,
    );
  }
}

class CustomTextStyle {
  static get titleMediumInterTightPrimary =>
      theme.textTheme.titleMedium!.outfit.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.3),
        fontWeight: FontWeight.w500,
      );

  static get titleMediumInterTightWhiteA700 =>
      theme.textTheme.titleMedium!.outfit.copyWith(
        color: appTheme.whiteA700,
        fontSize: 17.fSize,
      );

  static get titleMediumOutiftOnPrimary => theme.textTheme.titleMedium!.outfit
      .copyWith(color: theme.colorScheme.onPrimary, fontSize: 17.fSize);
}
