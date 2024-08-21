import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/utils/notification_permission.dart';
import '../../themes/custom_text_style.dart';
import '../../themes/theme_helper.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
  void handleNotificationPermission() async {
    try {
    } catch (e) {
      // Handle the exception or show an error message to the user
    }
  }
}

class NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 72.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 86.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 34.h),
                child: Lottie.asset(
                  'assets/images/Notification.json',
                  repeat: true,
                  height: 300.h,
                  width: double.maxFinite,
                ),
              ),
              SizedBox(height: 54.h),
              Text(
                "Don't miss out on important alerts, spending trends, payday and other account updates",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
              ),
              const Spacer(),
              CustomElevatedButton(
                text: 'Turn on notifications',
                onPressed: () {
                  requestPermission(permission: Permission.notification);
                },
              ),
              SizedBox(height: 34.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: CustomTextStyles.titleMedium17_1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
