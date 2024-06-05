import 'package:flutter/material.dart';
import 'package:myapp/core/utils/pref_utils.dart';

class ThemeProvider extends ChangeNotifier {
themeChange (String themeType) async {
  PrefUtils().setThemeData(themeType);
  notifyListeners();
}
}