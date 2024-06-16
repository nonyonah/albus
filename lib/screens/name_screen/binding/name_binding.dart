import 'package:albus/screens/name_screen/controller/name_controller.dart';
import 'package:get/get.dart';

class NameBinding extends Bindings {
  @override
  void dependencies() {
Get.lazyPut(() => NameController());
  }
}