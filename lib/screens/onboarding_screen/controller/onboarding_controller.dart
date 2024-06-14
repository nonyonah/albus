import 'package:albus/screens/onboarding_screen/models/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController{
  Rx<OnboardingModel> onboardingModelObj = OnboardingModel().obs;
}