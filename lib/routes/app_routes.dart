import 'package:albus/screens/onboarding_screen/onboarding_screen.dart';
import 'package:albus/screens/register_screen/register_screen.dart';
import 'package:albus/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String onboardingScreen = '/onboarding_screen';
  static const String registerScreen = '/register_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),
    registerScreen: (context) => const RegisterScreen(),
    initialRoute: (context) => const SplashScreen(),
  };
}
