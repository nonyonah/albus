import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../models/register_model.dart';

class RegisterState extends Equatable {
  final TextEditingController fullNameInputController;
  final TextEditingController emailInputController;
  final TextEditingController confirmEmailInputController;
  final TextEditingController passwordInputController;
  final bool isShowPassword;
  final RegisterModel registerModelObj;
  final RegistrationStatus registrationStatus;
  final String? errorMessage;

  const RegisterState({
    required this.fullNameInputController,
    required this.emailInputController,
    required this.confirmEmailInputController,
    required this.passwordInputController,
    required this.isShowPassword,
    required this.registerModelObj,
    this.registrationStatus = RegistrationStatus.initial,
    this.errorMessage,
  });

  RegisterState copyWith({
    TextEditingController? fullNameInputController,
    TextEditingController? emailInputController,
    TextEditingController? confirmEmailInputController,
    TextEditingController? passwordInputController,
    bool? isShowPassword,
    RegisterModel? registerModelObj,
    RegistrationStatus? registrationStatus,
    String? errorMessage,
  }) {
    return RegisterState(
      fullNameInputController: fullNameInputController ?? this.fullNameInputController,
      emailInputController: emailInputController ?? this.emailInputController,
      confirmEmailInputController: confirmEmailInputController ?? this.confirmEmailInputController,
      passwordInputController: passwordInputController ?? this.passwordInputController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      registerModelObj: registerModelObj ?? this.registerModelObj,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    fullNameInputController,
    emailInputController,
    confirmEmailInputController,
    passwordInputController,
    isShowPassword,
    registerModelObj,
    registrationStatus,
    errorMessage,
  ];
}

enum RegistrationStatus { initial, loading, success, failure }
