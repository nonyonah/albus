import 'package:flutter/material.dart';
import 'package:myapp/core/utils/image_constant.dart';
import 'package:myapp/core/utils/size_utils.dart';
import 'package:myapp/screens/onboarding_screen/models/onboarding_model.dart';
import 'package:myapp/screens/onboarding_screen/provider/onboarding_provider.dart';
import 'package:myapp/themes/custom_text_style.dart';
import 'package:myapp/themes/theme_helper.dart';
import 'package:myapp/widgets/custom_elevated_button.dart';
import 'package:myapp/themes/custom_button_style.dart';
import 'package:myapp/widgets/custom_image_view.dart';
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
                height: (35.v),
                width: (115.h),
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
