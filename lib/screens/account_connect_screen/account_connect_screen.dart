import 'package:albus/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';

class AccountConnectScreen extends ConsumerStatefulWidget {
  const AccountConnectScreen({super.key});

  @override
  AccountConnectScreenState createState() => AccountConnectScreenState();
}

class AccountConnectScreenState extends ConsumerState<AccountConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 64.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
              const Spacer(flex: 49),
              Lottie.asset(
                'assets/animations/wallet.json',
                height: 246.h,
                width: 248.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
