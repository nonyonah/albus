part of 'onboarding_notifier.dart';

class OnboardingState extends Equatable {
  final OnboardingModel? onboardingModelObj;

  const OnboardingState({this.onboardingModelObj});

  @override
  List<Object?> get props => [onboardingModelObj];

  OnboardingState copyWith({OnboardingModel? onboardingModelObj}) {
    return OnboardingState(
      onboardingModelObj: onboardingModelObj ?? this.onboardingModelObj,
    );
  }
}
