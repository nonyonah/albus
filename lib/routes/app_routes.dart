import 'package:flutter/material.dart';
import 'package:myapp/screens/onboarding_screen/onboarding_screen.dart';
import 'package:myapp/screens/register_screen/register_screen.dart';
import 'package:myapp/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreen = '/onboarding_screen';
  
  static const String registerScreen = '/register_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    onboardingScreen: OnboardingScreen.builder,
    registerScreen: RegisterScreen.builder,
    initialRoute: RegisterScreen.builder
  };
}