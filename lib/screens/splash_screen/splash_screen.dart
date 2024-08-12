import 'package:albus/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogoVector(context),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoVector(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogo,
            height: 34.h,
            width: 114.w,
          ),
        ],
      ),
    );
  }
}
