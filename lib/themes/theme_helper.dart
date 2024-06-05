import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/core/utils/pref_utils.dart';
import 'package:myapp/core/utils/size_utils.dart';

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
          backgroundColor: colorScheme.primary,
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
      fontFamily: 'InterTight',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: colorScheme.primary,
      fontSize: 13.fSize,
      fontFamily: 'InterTight',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.primary,
      fontSize: 24.fSize,
      fontFamily: 'InterTight',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: colorScheme.primary,
      fontSize: 16.fSize,
      fontFamily: 'InterTight',
      fontWeight: FontWeight.w700,
    ),
  );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF000000),
    onPrimary: Color(0x19000000),
    onPrimaryContainer: Color(0x4C000000),
  );
}

class LightCodeColors {
  Color get gray50 => const Color(0xFFF8F8F8);
  Color get whiteA700 => const Color(0xFFFFFFFF);
}
