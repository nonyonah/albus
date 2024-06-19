import 'package:flutter/material.dart';
import 'package:albus/screens/create_password_screen/models/create_password_model.dart';
import 'package:get/get.dart';

class CreateYourPasswordController extends GetxController {
  TextEditingController passwordFieldController = TextEditingController();

  Rx<CreateYourPasswordModel> createYourPasswordModelObj =
      CreateYourPasswordModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    passwordFieldController.dispose();
  }
}