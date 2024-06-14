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
            horizontal: (38.h),
            vertical: (70.v),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              _buildVectorSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVectorSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogo,
            height: 240.v,
            width: 240.h,
          ),
          SizedBox(height: 262.v),
          CustomElevatedButton(
            text: 'Get Started',
            margin: EdgeInsets.only(left: 4.h),
          ),
          SizedBox(height: 40.v),
          Text(
            'Login',
            style: CustomTextStyle.titleMediumInterTightPrimary,
          )
        ]
    ),
    );
  }
}
