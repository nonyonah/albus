import 'package:albus/screens/register_screen/models/register_model.dart';
import 'package:flutter/material.dart';


class RegisterProvider extends ChangeNotifier {
  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  RegisterModel registerModelObj = RegisterModel();

  @override
  void dispose() {
    super.dispose();
    emailInputController.dispose();
    passwordInputController.dispose();
  }
}