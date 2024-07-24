import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:albus/core/utils/validation_functions.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_text_form.dart';
import 'package:albus/screens/login_screen/controller/login_controller.dart';
import 'package:get/get.dart';

import '../../themes/theme_helper.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA700,
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
                    horizontal: 26.h,
                    vertical: 76.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.v),
                      Text(
                        'Log in',
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 28.v),
                      Text(
                        'Enter your login credentials here',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 32.v),
                      Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: CustomTextFormField(
                          controller: controller.emailInputController,
                          hintText: 'Email address',
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
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
}
