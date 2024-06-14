import 'package:albus/screens/register_screen/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController{
  TextEditingController emailInputController = TextEditingController();
  Rx<RegisterModel> registerModelObj = RegisterModel().obs;
  
  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
  }
}
