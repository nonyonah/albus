import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import '../models/notification_permission_model.dart';

class NotificationPermissionController extends GetxController {
  Rx<NotificationPermissionModel> notificationPermissionModelObj = NotificationPermissionModel().obs;

  Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (status.isGranted) {
      // Permission is already granted
      notificationPermissionModelObj.update((model) {
        model?.isPermissionGranted = true;
      });
    } else {
      // Request permission
      if (await Permission.notification.request().isGranted) {
        // Permission granted
        notificationPermissionModelObj.update((model) {
          model?.isPermissionGranted = true;
        });
      } else {
        // Permission denied
        notificationPermissionModelObj.update((model) {
          model?.isPermissionGranted = false;
        });
      }
    }
  }

  void showPermissionDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Enable Notifications'),
        content: const Text('Do you want to enable notifications to stay updated with important alerts?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              await requestNotificationPermission();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
