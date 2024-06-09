import 'package:albus/screens/onboarding_screen/models/onboarding_model.dart';
import 'package:flutter/material.dart';


class OnboardingProvider extends ChangeNotifier{
  OnboardingModel onboardingModelObj = OnboardingModel();

  @override
  void dispose() {
    super.dispose();
  }
}