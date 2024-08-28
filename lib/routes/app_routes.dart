import 'package:albus/screens/cash_balance_setup_screen/cash_balance_setup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/notification_screen/notification_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/register_screen/register_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'package:albus/screens/category_screen/category_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String registerScreen = '/register';
  static const String otpScreen = '/otp';
  static const String notificationPermissionScreen = '/notification';
  static const String categoryScreen = '/category';
  static const String cashBalanceSetupScreen = '/cash';
  static const String loginScreen = '/login';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),
    registerScreen: (context) => const RegisterScreen(),
    cashBalanceSetupScreen: (context) => const CashBalanceSetupScreen(),
    notificationPermissionScreen: (context) => const NotificationScreen(),
    categoryScreen: (context) => const CategoriesScreen(),
    //loginScreen: (context) => SplashScreen(),
    initialRoute: (context) => const SplashScreen()
  };
}
