import 'dart:ui';
import 'package:albus/core/utils/pref_utils.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  var _appTheme = PrefUtils().getThemeData();

  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedCustomScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme = 
    _supportedCustomScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: colorScheme.primary,
      fontSize: 16.fSize,
      fontFamily: GoogleFonts.outfit().fontFamily,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      color: colorScheme.primary,
      fontSize: 13.fSize,
      fontFamily: GoogleFonts.outfit().fontFamily,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.primary,
      fontSize: 24.fSize,
      fontFamily: GoogleFonts.outfit().fontFamily,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: colorScheme.primary,
      fontSize: 17.fSize,
      fontFamily: GoogleFonts.outfit().fontFamily,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 13.fSize,
      fontFamily: GoogleFonts.outfit().fontFamily,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 10.fSize,
      fontFamily: GoogleFonts.outfit().fontFamily,
      fontWeight: FontWeight.w700,
    ),
  );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF000000),
    onPrimary: Color(0xFF131313),
    onPrimaryContainer: Color(0xFF5E548E),
  );
}

class LightCodeColors {
  Color get gray50 => const Color(0xFFF8F8F8);
  Color get whiteA700 => const Color(0xFFFFFFFF);
  Color get black900 => const Color(0xFF0C0C0C);
  Color get blueGray100 => const Color(0xFFD9D9D9);
  Color get blueGray400 => const Color (0xFF888888);
}
