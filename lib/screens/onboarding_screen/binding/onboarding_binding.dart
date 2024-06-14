import 'package:albus/screens/onboarding_screen/controller/onboarding_controller.dart';
import 'package:get/get.dart';


class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}