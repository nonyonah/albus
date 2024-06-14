import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/core/utils/validation_functions.dart';
import 'package:albus/screens/register_screen/controller/register_controller.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:albus/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<RegisterController> {
    RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: double.maxFinite,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: (26.h),
                    vertical: (76.v),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        onTap: () {
                          onTapImgBackArrow();
                        },
                      ),
                      SizedBox(height: 50.v),
                        Text(
                          'Register',
                          style: theme.textTheme.headlineSmall,
                        ),
                        SizedBox(height: 26.v),
                          Text(
                            'Enter your email address',
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 30.v),
                          CustomTextFormField(
                            controller: controller.emailInputController,
                            hintText: 'Email address',
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || 
                              (!isValidEmail(value, isRequired: true))) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const Spacer(),
                          CustomElevatedButton(
                            text: 'Continue',
                            margin: EdgeInsets.symmetric(horizontal: 12.h),
                            alignment: Alignment.center,
                          )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapImgBackArrow() {
    Get.back();
  }
}

  