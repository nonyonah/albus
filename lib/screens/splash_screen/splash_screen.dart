import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/splash_screen/controller/splash_controller.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(26.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogoSection(),
                SizedBox(
                  height: 4.v,
                )
              ],
            )),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogo,
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }
}
