import 'package:albus/screens/register_screen/notifier/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(super.state);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword));
  }

  Future<void> registerUser() async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: state.emailInputController.text,
        password: state.passwordInputController.text,
      );

      // If successful, store additional user data in Firestore
      if (userCredential.user != null) {
        await storeUserData(userCredential.user!.uid);

        // Update state to reflect successful registration
        state = state.copyWith(registrationStatus: RegistrationStatus.success);
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'An account already exists for that email.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }

      // Update state with error
      state = state.copyWith(
        registrationStatus: RegistrationStatus.failure,
        errorMessage: errorMessage,
      );
    } catch (e) {
      // Handle other errors
      state = state.copyWith(
        registrationStatus: RegistrationStatus.failure,
        errorMessage: 'An unexpected error occurred.',
      );
    }
  }

  Future<void> storeUserData(String uid) async {
    await _firestore.collection('users').doc(uid).set({
      'fullName': state.fullNameInputController.text,
      'email': state.emailInputController.text,
      // Add any other fields you want to store
    });
  }
}