import 'package:albus/core/utils/pref_utils.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  final _appTheme = PrefUtils().getThemeData();

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  final Map<String, ColorScheme> _supportedCustomScheme = {
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
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(
              color: appTheme.black900.withOpacity(0.5),
              width: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primary));
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 10.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.3),
          fontSize: 64.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 48.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 24.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: appTheme.grey5001,
          fontSize: 10.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
      );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF252422),
    primaryContainer: Color(0XFF023E8A),
    secondaryContainer: Color(0X33FF0000),
    errorContainer: Color(0XFF284B63),
    onError: Color(0XFF7209B7),
    onPrimary: Color(0x7FFFFFFF),
    onPrimaryContainer: Color(0xFF023E8A),
  );
}

class LightCodeColors {
  Color get gray50 => const Color(0xFFF8F8F8);
  Color get whiteA700 => const Color(0xFFFFFFFF);
  Color get black900 => const Color(0xFF000000);
  Color get blueGray50 => const Color(0XFFEFF1F3);
  Color get blueGray100 => const Color(0xFFD3D3D3);
  Color get gray500 => const Color(0xFF9B9B9B);
  Color get blueGray10001 => const Color(0XFFD9D9D9);
  Color get grey5001 => const Color(0xFF9B9B9B);
  Color get cyan600 => const Color(0XFF00AFB9);
  Color get gray100 => const Color(0XFFF7F7F7);
  Color get gray100F6 => const Color(0XF6F6F6F6);
  Color get lightBlue400 => const Color(0XFF26C9FC);
  Color get red100 => const Color(0XFFFFC8DD);
  Color get greenA700 => const Color(0XFF00AB66);
  Color get yellow900 => const Color(0XFFE17A2C);
}
