import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/image_constant.dart';
import '../../themes/custom_text_style.dart';
import 'controller/notification_permission_controller.dart';
import 'package:albus/widgets/custom_elevated_button.dart';

class NotificationPermissionScreen
    extends GetWidget<NotificationPermissionController> {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 72.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140.v),
              CustomImageView(
                imagePath: ImageConstant.imgNotifications,
                height: 300.adaptSize,
                width: double.maxFinite,
                margin: EdgeInsets.only(
                  left: 28.h,
                  right: 30.h,
                ),
              ),
              SizedBox(height: 52.v),
              Text(
                'Don\'t miss out on important alerts, spending trends, payday and other account updates',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              CustomElevatedButton(
                text: 'Turn on notifications',
                onPressed: () {
                  controller.showPermissionDialog(context);
                },
              ),
              SizedBox(height: 20.v),
              TextButton(
                onPressed: () {
                  Get.toNamed('/');
                },
                child: Text(
                  'Skip',
                  style: CustomTextStyle.titleMediumOutiftOnPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
