import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';

import '../../core/utils/pref_utils.dart';
import 'theme_state.dart';

final themeNotifier = StateNotifierProvider<ThemeNotifier, ThemeState>(
    (ref) => ThemeNotifier(ThemeState(themeType: PrefUtils().getThemeData())));

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier(ThemeState state) : super(state);

  changeTheme(String themeType) async {
    PrefUtils().setThemeData(themeType);
    state = state.copyWith(themeType: PrefUtils().getThemeData());
  }
}
