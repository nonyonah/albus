import 'package:albus/screens/notification_permission_screen/controller/notification_permission_controller.dart';
import 'package:get/get.dart';

class NotificationPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPermissionController());
  }
}
