import 'package:flutter/material.dart';
import 'package:myapp/screens/register_screen/models/register_model.dart';

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