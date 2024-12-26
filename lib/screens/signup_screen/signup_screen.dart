import 'package:albus/auth/googleauth/google_sign_in.dart';
import 'package:albus/core/utils/lottie_services.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 70.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 58,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 200.h,
                width: 200.h,
              ),
              const Spacer(
                flex: 41,
              ),
              // CustomElevatedButton(
              //   text: 'Sign up with Apple',
              //   leftIcon: Container(
              //     margin: EdgeInsets.only(right: 16.h),
              //     child: CustomImageView(
              //       imagePath: ImageConstant.imgApple,
              //       height: 20.h,
              //       width: 20.h,
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              //   buttonTextStyle: CustomTextStyles.titleMediumGray50,
              //   onPressed: () {},
              // ),
              SizedBox(height: 14.h),
              CustomElevatedButton(
                text: 'Continue with Google',
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 16.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGoogle,
                    height: 20.h,
                    width: 20.h,
                    fit: BoxFit.contain,
                  ),
                ),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA70017,
                onPressed: () {
                   onTapSignIn(context);
                },
              ),
              // SizedBox(height: 24.h),
              // Text(
              //   'Already have an account? Sign in',
              //   style: CustomTextStyles.titleMedium17,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> onTapSignIn(BuildContext context) async {
  final googleSignIn = GoogleSignInService();

  try {
    // Show loading indicator
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const LoadingDialog());

    final userData = await googleSignIn.signIn();

    // Hide loading indicator
    if (context.mounted) Navigator.pop(context);

    if (userData != null) {
      print('Name: ${userData.name}');
      print('Email: ${userData.email}');
      // Store these details in your database or proceed with your app logic
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: const Text('Sign in cancelled'),
            backgroundColor: appTheme.graySnackBar
          ),
        );
      }
    }
  } on GoogleSignInException catch (e) {
    // Hide loading indicator if error occurs
    if (context.mounted) Navigator.pop(context);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: appTheme.graySnackBar,
        ),
      );
    }
  } catch (e) {
    // Hide loading indicator if error occurs
    if (context.mounted) Navigator.pop(context);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign in error: $e'),
          backgroundColor: appTheme.graySnackBar,
        ),
      );
    }
  }
}
