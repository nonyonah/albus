import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/onboarding_model.dart';
part 'onboarding_state.dart';

final onboardingNotifier = StateNotifierProvider<OnboardingNotifier, OnboardingState>(
    (ref) => OnboardingNotifier(const OnboardingState(
          onboardingModelObj: OnboardingModel(),
        ),),);

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier(super.state);
}
