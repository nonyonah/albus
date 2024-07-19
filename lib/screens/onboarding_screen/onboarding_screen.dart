import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/onboarding_screen/controller/onboarding_controller.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({super.key});

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
                imagePath: ImageConstant.imgOnboarding,
                height: 300.adaptSize,
                width: double.maxFinite,
              ),
              SizedBox(height: 52.v),
              Text(
                'Simplify your finances by tracking expenses, setting budgets, and achieving your financial goals',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              _buildGetStartedSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedSection() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(
          children: [
            CustomElevatedButton(
              text: 'Get Started',
              margin: EdgeInsets.only(left: 4.h),
              onPressed: () {
                Get.toNamed('/register');
              },
            ),
            SizedBox(height: 20.v),
            TextButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: Text(
                'Login',
                style: CustomTextStyle.titleMediumOutiftOnPrimary,
              ),
            ),
          ],
        ));
  }
}
