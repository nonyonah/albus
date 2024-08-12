import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/register_model.dart';
import 'register_state.dart';

// Register State Notifier Provider
final registerNotifier = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(RegisterState(
    fullNameInputController: TextEditingController(),
    emailInputController: TextEditingController(),
    confirmEmailInputController: TextEditingController(),
    passwordInputController: TextEditingController(),
    isShowPassword: true,
    registerModelObj: RegisterModel(),
  )),
);

// Register Notifier Class
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(super.state);

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword));
  }
}
