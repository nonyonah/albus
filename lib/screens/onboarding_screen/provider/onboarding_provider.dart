import 'package:flutter/material.dart';
import 'package:myapp/screens/onboarding_screen/models/onboarding_model.dart';

class OnboardingProvider extends ChangeNotifier{
  OnboardingModel onboardingModelObj = OnboardingModel();

  @override
  void dispose() {
    super.dispose();
  }
}