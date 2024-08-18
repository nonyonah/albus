import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    registerModelObj: const RegisterModel(),
    registrationStatus: RegistrationStatus.initial,
  )),
);

// Register Notifier Class
class RegisterNotifier extends StateNotifier<RegisterState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RegisterNotifier(RegisterState state) : super(state);

  Future<void> registerUser() async {
    state = state.copyWith(registrationStatus: RegistrationStatus.loading);

    try {
      // Validate email confirmation
      if (state.emailInputController.text != state.confirmEmailInputController.text) {
        throw Exception("Email addresses do not match");
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: state.emailInputController.text,
        password: state.passwordInputController.text,
      );

      if (userCredential.user != null) {
        await storeUserData(userCredential.user!.uid);
        state = state.copyWith(
          registrationStatus: RegistrationStatus.success,
          errorMessage: null,
        );
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
    } catch (e) {
      state = state.copyWith(
        registrationStatus: RegistrationStatus.failure,
        errorMessage: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }

  Future<void> storeUserData(String uid) async {
    await _firestore.collection('users').doc(uid).set({
      'fullName': state.fullNameInputController.text,
      'email': state.emailInputController.text,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }
}