import 'package:flutter/material.dart';
import '../screens/notification_screen/notification_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/register_screen/register_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String registerScreen = '/register';
  static const String otpScreen = '/otp';
  static const String notificationPermissionScreen = '/notification';
  static const String loginScreen = '/login';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),
    registerScreen: (context) => const RegisterScreen(),
    //otpScreen: (context) => SplashScreen(),
    notificationPermissionScreen: (context) => const NotificationScreen(),
    //loginScreen: (context) => SplashScreen(),
    initialRoute: (context) => const SplashScreen()
  };
}
