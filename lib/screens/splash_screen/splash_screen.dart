import 'package:flutter/material.dart';
import 'package:myapp/core/utils/image_constant.dart';
import 'package:myapp/core/utils/size_utils.dart';
import 'package:myapp/screens/splash_screen/models/splash_model.dart';
import 'package:myapp/screens/splash_screen/provider/splash_provider.dart';
import 'package:myapp/themes/theme_helper.dart';
import 'package:myapp/widgets/custom_image_view.dart';
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
                height: 35.v,
                width: 115.h
              )
            ],
          ),
      ),
    ),
    );
  }
}