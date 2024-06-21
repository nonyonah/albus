import 'package:albus/core/services/auth_service.dart';
import 'package:albus/screens/register_screen/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  
  TextEditingController emailInputController = TextEditingController();
  Rx<RegisterModel> registerModelObj = RegisterModel().obs;
  
  // Method to handle email registration and navigate to password screen
  void registerUser(String email) {
    // Pass the email to the password screen
    Get.toNamed('/createyourpassword', arguments: {'email': email});
  }

  // Method to handle registration with email and password
  void registerUserWithPassword(String email, String password) {
    AuthService.instance.createUserWithPassword(email, password);
  }
}
