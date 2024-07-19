import 'package:albus/core/services/auth_service.dart';
import 'package:albus/screens/register_screen/models/register_model.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  
  TextEditingController fullNameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController confirmEmailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController phoneNumberInputController = TextEditingController();
  

  Rx<RegisterModel> registerModelObj = RegisterModel().obs;
  var country = CountryPickerUtils.getCountryByIsoCode('US').obs;
  
  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    fullNameInputController.dispose();
    emailInputController.dispose();
    confirmEmailInputController.dispose();
    passwordInputController.dispose();
    phoneNumberInputController.dispose();
    super.onClose();
    
  }
  
}
