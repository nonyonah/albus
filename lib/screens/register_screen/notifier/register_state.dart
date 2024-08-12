import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/register_model.dart';

class RegisterState extends Equatable {
  final TextEditingController fullNameInputController;
  final TextEditingController emailInputController;
  final TextEditingController confirmEmailInputController;
  final TextEditingController passwordInputController;
  final bool isShowPassword;
  final RegisterModel registerModelObj;

  RegisterState({
    required this.fullNameInputController,
    required this.emailInputController,
    required this.confirmEmailInputController,
    required this.passwordInputController,
    required this.isShowPassword,
    required this.registerModelObj,
  });

  RegisterState copyWith({
    TextEditingController? fullNameInputController,
    TextEditingController? emailInputController,
    TextEditingController? confirmEmailInputController,
    TextEditingController? passwordInputController,
    bool? isShowPassword,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      fullNameInputController: fullNameInputController ?? this.fullNameInputController,
      emailInputController: emailInputController ?? this.emailInputController,
      confirmEmailInputController: confirmEmailInputController ?? this.confirmEmailInputController,
      passwordInputController: passwordInputController ?? this.passwordInputController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      registerModelObj: registerModelObj ?? this.registerModelObj,
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
      ];
}
