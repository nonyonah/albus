import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/image_constant.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 72.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 86.h,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgOnboarding,
                height: 300.h,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 34.h),
              ),
              SizedBox(height: 54.h),
              Text(
                'Simplify your finances by tracking expenses, setting budgets, and achieving your financial goals',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
              ),
              const Spacer(),
              _buildAuthenticationSection(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthenticationSection(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(
          children: [
            const CustomElevatedButton(text: 'Get Started'),
            SizedBox(height: 34.h),
            TextButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: CustomTextStyle.titleMediumInterTightPrimary,
              ),
            )
          ],
        ));
  }
}
