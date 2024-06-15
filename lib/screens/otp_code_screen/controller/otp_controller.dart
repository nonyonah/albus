import 'package:flutter/material.dart';
import 'package:albus/screens/otp_code_screen/models/otp_models.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OtpCodeController extends GetxController {
  TextEditingController otpController = TextEditingController();
  Rx<OtpCodeModel> otpCodeModelObj = OtpCodeModel().obs;

  @override
  void onClose() {
    super.onClose();
    otpController.dispose();
  }
}


