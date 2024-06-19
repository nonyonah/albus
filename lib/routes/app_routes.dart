import 'package:albus/screens/create_password_screen/binding/create_password_binding.dart';
import 'package:albus/screens/create_password_screen/create_password.dart';
import 'package:albus/screens/name_screen/binding/name_binding.dart';
import 'package:albus/screens/name_screen/name_screen.dart';
import 'package:albus/screens/onboarding_screen/binding/onboarding_binding.dart';
import 'package:albus/screens/onboarding_screen/onboarding_screen.dart';
import 'package:albus/screens/otp_code_screen/binding/otp_binding.dart';
import 'package:albus/screens/otp_code_screen/otp_code_screen.dart';
import 'package:albus/screens/register_screen/binding/register_binding.dart';
import 'package:albus/screens/register_screen/register_screen.dart';
import 'package:albus/screens/splash_screen/binding/splash_binding.dart';
import 'package:albus/screens/splash_screen/splash_screen.dart';
import 'package:get/route_manager.dart';


class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String registerScreen = '/register';
  static const String otpScreen = '/otp';
  static const String nameScreen = '/name';
  static const String createYourPasswordScreen = '/createyourpassword';

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
    GetPage(
      name: otpScreen,
      page: () => const OtpCodeScreen(),
      bindings: [OtpCodeBinding()],
    ),
    GetPage(
      name: nameScreen,
      page: () => NameScreen(),
      bindings: [NameBinding()],
    ),
    GetPage(
      name: createYourPasswordScreen,
      page: () => CreateYourPasswordScreen(),
      bindings: [CreateYourPasswordBinding()],
    )
  ];
}
