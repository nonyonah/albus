import 'package:albus/screens/onboarding_screen/binding/onboarding_binding.dart';
import 'package:albus/screens/onboarding_screen/onboarding_screen.dart';
import 'package:albus/screens/register_screen/binding/register_binding.dart';
import 'package:albus/screens/register_screen/register_screen.dart';
import 'package:albus/screens/splash_screen/binding/splash_binding.dart';
import 'package:albus/screens/splash_screen/splash_screen.dart';
import 'package:get/route_manager.dart';


class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String registerScreen = '/register';
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [SplashBinding()]
    ),
    GetPage(
      name: onboardingScreen,
      page: () => const OnboardingScreen(),
      bindings: [OnboardingBinding()],
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      bindings: [RegisterBinding()],
    ),
  ];
}
