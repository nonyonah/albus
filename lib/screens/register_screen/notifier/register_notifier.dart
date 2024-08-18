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
  )),
);

// Register Notifier Class
class RegisterNotifier extends StateNotifier<RegisterState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void>registerUser() async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: state.emailInputController.text,
        password: state.passwordInputController.text,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
  

  RegisterNotifier(super.state);

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword));
  }
}




