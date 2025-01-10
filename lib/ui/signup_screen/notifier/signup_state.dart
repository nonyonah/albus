part of 'signup_notifier.dart';

// ignore: must_be_immutable
class SignUpState extends Equatable {
  SignUpState({this.signUpModelObj});

  SignUpModel? signUpModelObj;

  @override
  List<Object?> get props => [signUpModelObj];
  SignUpState copyWith({SignUpModel? signUpModelObj}) {
    return SignUpState(
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}