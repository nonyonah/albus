import 'package:albus/routes/app_routes.dart';
import 'package:albus/screens/splash_screen/models/splash_model.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.onboardingScreen,
      );
    }
    );
  }
}