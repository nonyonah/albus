import 'package:albus/screens/create_password_screen/controller/create_password_controller.dart';
import 'package:get/get.dart';

class CreateYourPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateYourPasswordController());
    }
  }