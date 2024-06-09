import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/routes/app_routes.dart';
import 'package:albus/screens/splash_screen/provider/splash_provider.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: const SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 320.v,
                width: 320.h
              )
            ],
          ),
      ),
    ),
    );
  }
}