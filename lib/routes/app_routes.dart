import 'package:flutter/material.dart';
import '../screens/notification_screen/notification_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/register_screen/register_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'package:albus/screens/category_screen/category_screen.dart';

import '../screens/suggestion_screen/suggestion_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String registerScreen = '/register';
  static const String otpScreen = '/otp';
  static const String notificationPermissionScreen = '/notification';
  static const String categoryScreen = '/category';
  static const String suggestionScreen = '/suggestion';
  static const String loginScreen = '/login';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),
    registerScreen: (context) => const RegisterScreen(),
    suggestionScreen: (context) => const SuggestionScreen(),
    notificationPermissionScreen: (context) => const NotificationScreen(),
    categoryScreen: (context) => const CategoriesScreen(),
    //loginScreen: (context) => SplashScreen(),
    initialRoute: (context) => const SplashScreen()
  };
}
