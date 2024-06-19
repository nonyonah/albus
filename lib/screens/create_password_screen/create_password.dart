import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/create_password_screen/controller/create_password_controller.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_text_form.dart';
import 'package:albus/core/utils/validation_functions.dart';
import 'package:get/get.dart';

class CreateYourPasswordScreen extends GetWidget<CreateYourPasswordController> {
  CreateYourPasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Ensure theme is initialized from context
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Container(
                width: SizeUtils.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 26.h,
                  vertical: 58.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      onTap: () {
                        backButton();
                      },
                    ),
                    SizedBox(
                      height: 50.v,
                    ),
                    Text(
                      'Create Your Password',
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 26.v,
                    ),
                    Text(
                      'Enter your desired password',
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 30.v,
                    ),
                    _buildPasswordField(),
                    const Spacer(),
                    CustomElevatedButton(
                      text: 'Continue',
                      margin: EdgeInsets.symmetric(horizontal: 12.h),
                      alignment: Alignment.center,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Implement your continue logic here
                        }
                      },
                    ),
                    SizedBox(height: 18.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: Obx(
        () => CustomTextFormField(
          controller: controller.passwordFieldController,
          hintText: 'Password',
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value = !controller.isShowPassword.value;
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 18.h, 12.v),
              child: CustomImageView(
                imagePath: controller.isShowPassword.value
                    ? ImageConstant.imgEyeClose
                    : ImageConstant.imgEyeOpen, 
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 48.v,
          ),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return 'Please enter a valid password';
            }
            return null;
          },
          obscureText: controller.isShowPassword.value,
          contentPadding: EdgeInsets.only(
            left: 16.h,
            top: 12.v,
            bottom: 12.v,
          ),
        ),
      ),
    );
  }

  void backButton() {
    Get.back();
  }
}
