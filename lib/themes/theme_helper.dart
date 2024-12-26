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
      scaffoldBackgroundColor: appTheme.gray5001,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: colorScheme.primary,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.black900.withOpacity(0.3),
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray700,
          fontSize: 14.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 12.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 64.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 40.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 30.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 26.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 25.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.5),
          fontSize: 12.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 10.fSize,
          fontFamily: GoogleFonts.interTight().fontFamily,
          fontWeight: FontWeight.w500,
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
          fontWeight: FontWeight.w600,
        ),
      );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
      primary: Color(0xFF121212),
      primaryContainer: Color(0XFF664E27),
      secondaryContainer: Color(0XFF2775CA),
      errorContainer: Color(0XFF321B41),
      onError: Color(0X7FFFFFFF),
      onErrorContainer: Color(0xFFF9C32C),
      onPrimary: Color(0xFF00AB66),
      onPrimaryContainer: Color(0x0A0A0D12),
      onSecondaryContainer: Color(0xFF0E0E0E));
}

class LightCodeColors {
  Color get gray50 => const Color(0xFFF8F8F8);
  Color get whiteA700 => const Color(0xFFFFFFFF);
  Color get black900 => const Color(0xFF000000);
  Color get blueGray50 => const Color(0XFFEFF1F3);
  Color get blueGray100 => const Color(0xFFD3D3D3);
  Color get blueGray700 => const Color(0xFF535861);
  Color get blueGray5001 => const Color(0xFFEFF1F3);
  Color get gray200 => const Color(0xFFECECEC);
  Color get gray500 => const Color(0xFF9E88AD);
  Color get gray50F8 => const Color(0xF8F8F8F8);
  Color get gray10001 => const Color(0xFFF2F2F2);
  Color get gray20001 => const Color(0xFF9B9B9B);
  Color get gray20002 => const Color(0xFFF0F0F0);
  Color get blueGray10002 => const Color(0XFFD9D9D9);
  Color get gray5001 => const Color(0xFFFAF9F6);
  Color get gray5002 => const Color(0xFFF9F5FF);
  Color get cyan600 => const Color(0XFF00AFB9);
  Color get gray100 => const Color(0XFFF7F7F7);
  Color get gray100F6 => const Color(0XF6F6F6F6);
  Color get lightBlue400 => const Color(0XFF26C9FC);
  Color get red100 => const Color(0XFFFFC8DD);
  Color get redA700 => const Color(0xFFFF0000);
  Color get greenA700 => const Color(0XFF00AB66);
  Color get yellow900 => const Color(0XFFE17A2C);
  Color get graySnackBar => const Color(0xFF000000);
}
