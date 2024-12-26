import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/signup_model.dart';
part 'signup_state.dart';

final signUpNotifier = StateNotifierProvider<SignUpNotifier, SignUpState>(
    (ref) => SignUpNotifier(SignUpState(
          signUpModelObj: const SignUpModel(),
        ),),);

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier(super.state);
}