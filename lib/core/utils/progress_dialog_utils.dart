import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class ProgressDialogUtils {
  static bool isProgressVisible = false;

  static void showProgressDialog({bool isCancellable = false}) async {
    if(!isProgressVisible) {
      Get.dialog(
        Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
               Colors.white, 
            ),
          ),
        ),
        barrierDismissible: isCancellable
      );
      isProgressVisible = true;
    }
  }

    static void hideProgressDialog() {
      if(isProgressVisible) Get.back();
      isProgressVisible = false;
    }
  }
  