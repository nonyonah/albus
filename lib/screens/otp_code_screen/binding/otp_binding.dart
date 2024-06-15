import 'package:albus/screens/otp_code_screen/controller/otp_controller.dart';
import 'package:get/get.dart';

class OtpCodeBinding extends Bindings {
  @override
  void dependencies() {
Get.lazyPut(() => OtpCodeController());
  }
}