import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/image_constant.dart';
import '../../themes/theme_helper.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBack,
                height: 24.h,
                width: 26.h,
                fit: BoxFit.contain,
              ),
              const Spacer(flex: 49),
              Center(
                child: Lottie.asset(
                  'assets/animations/wallet.json',
                  height: 246.h,
                  width: 248.h,
                ),
              ),
              SizedBox(height: 44.h),
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Get a complete picture of your finances with your accounts and wallets in one place',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumBlack900_1.copyWith(
                    height: 1.57,
                  ),
                ),
              ),
              const Spacer(flex: 50),
              CustomElevatedButton(
                text: 'Connect',
                margin: EdgeInsets.only(
                  left: 10.h,
                  right: 12.h,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 300.h,
                              width: double.infinity,
                              padding: EdgeInsets.all(24.h),
                              child: Column(
                                children: [
                                  Text(
                                    'Accounts',
                                    style: CustomTextStyles.titleLarge22,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Securely give albus access to automatically keep track of your accounts and wallets. We don\'t sell or share your data.',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.titleMedium17,
                                  ),
                                  SizedBox(height: 30.h),
                                  CustomElevatedButton(
                                    text: 'Import address',
                                    margin: EdgeInsets.only(
                                      left: 10.h,
                                      right: 12.h,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      textStyle: CustomTextStyles.titleMedium17
                                          .copyWith(
                                        fontSize: 17.fSize,
                                      ),
                                    ),
                                    child: const Text('Link an institution'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
