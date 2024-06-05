import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigator_service.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  static void showProgressDialog(
    {BuildContext? context, bool isCancellable = false}
  ) async {
      if (!isProgressVisible && NavigatorService.navigatorkey.currentState?.overlay?.context  !=null) {
        showDialog(
          barrierDismissible: isCancellable,
          context: NavigatorState.navigatorKey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
              )
              )
            );
          }
        );
        isProgressVisible = true;
      }
    }

    static void hideProgressDialog(){
      if (isProgressVisible)
      Navigator.pop(
        NavigatorState.navigatorKey.currentState!.overlay!.context
      );
      isProgressVisible = false;
    }
}