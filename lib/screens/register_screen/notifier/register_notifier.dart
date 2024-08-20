import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/snackbar.dart';
import '../../../repository/auth_repository.dart';
import '../models/register_model.dart';
import 'register_state.dart';

// Register State Notifier Provider
final registerNotifier = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(
    RegisterState(
      fullNameInputController: TextEditingController(),
      emailInputController: TextEditingController(),
      passwordInputController: TextEditingController(),
      isShowPassword: true,
      registerModelObj: const RegisterModel(),
      registrationStatus: RegistrationStatus.initial,
    ),
    ref.read(authRepositoryProvider),
  ),
);

// Auth Repository Provider
final authRepositoryProvider = Provider((ref) => AuthRepository());

// Register Notifier Class
class RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthRepository _authRepository;

  RegisterNotifier(RegisterState state, this._authRepository) : super(state);

  Future<void> registerUser(BuildContext context) async {
    state = state.copyWith(registrationStatus: RegistrationStatus.loading);

    try {
      UserCredential userCredential = await _authRepository.registerUser(
        state.emailInputController.text,
        state.passwordInputController.text,
      );

      if (userCredential.user != null) {
        await _authRepository.storeUserData(
          userCredential.user!.uid,
          state.fullNameInputController.text,
          state.emailInputController.text,
        );
        state = state.copyWith(
          registrationStatus: RegistrationStatus.success,
          errorMessage: null,
        );
        showSnackbar(context, 'Registration successful!', color: Colors.black);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for that email.';
      } else {
        errorMessage = 'An error occurred during registration: ${e.message}';
      }
      state = state.copyWith(
        registrationStatus: RegistrationStatus.failure,
        errorMessage: errorMessage,
      );
      showSnackbar(context, errorMessage, color: Colors.black);
    } catch (e) {
      state = state.copyWith(
        registrationStatus: RegistrationStatus.failure,
        errorMessage: 'An unexpected error occurred: ${e.toString()}',
      );
      showSnackbar(context, 'An unexpected error occurred',
          color: Colors.black);
    }
  }

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }

  @override
  void dispose() {
    state.fullNameInputController.dispose();
    state.emailInputController.dispose();
    state.passwordInputController.dispose();
    super.dispose();
  }
}
