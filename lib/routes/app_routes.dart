import 'package:albus/screens/notification_permission_screen/notification_permission_screen.dart';
import 'package:albus/screens/onboarding_screen/binding/onboarding_binding.dart';
import 'package:albus/screens/onboarding_screen/onboarding_screen.dart';
import 'package:albus/screens/otp_code_screen/binding/otp_binding.dart';
import 'package:albus/screens/otp_code_screen/otp_code_screen.dart';
import 'package:albus/screens/register_screen/binding/register_binding.dart';
import 'package:albus/screens/register_screen/register_screen.dart';
import 'package:albus/screens/splash_screen/binding/splash_binding.dart';
import 'package:albus/screens/splash_screen/splash_screen.dart';
import 'package:get/route_manager.dart';

import '../screens/notification_permission_screen/binding/notification_permission_binding.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String registerScreen = '/register';
  static const String otpScreen = '/otp';
  static const String notificationPermissionScreen = '/notification';

  static List<GetPage> pages = [
    GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        bindings: [SplashBinding()]),
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
    GetPage(
      name: otpScreen,
      page: () => const OtpCodeScreen(),
      bindings: [OtpCodeBinding()],
    ),
    GetPage(
      name: notificationPermissionScreen,
      page: () => const NotificationPermissionScreen(),
      bindings: [NotificationPermissionBinding()],
    )
  ];
}
