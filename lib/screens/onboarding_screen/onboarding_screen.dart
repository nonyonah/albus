import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/onboarding_screen/provider/onboarding_provider.dart';
import 'package:albus/themes/custom_button_style.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: const OnboardingScreen(),
    );
  }
}

class OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

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
              const Spacer(
                flex: 56,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: (320.v),
                width: (320.h),
              ),
              const Spacer(
                flex: 43,
              ),
              CustomElevatedButton(
                text: 'Create Account',
                buttonStyle: CustomButtonStyles.fillBlack,
              ),
              SizedBox(
                height: (40.v),
              ),
              Text(
                'Login',
                style: CustomTextStyle.titleMediumOutiftOnPrimary
              ),
            ],
          ),
        ),
      ),
    );
  }
}
