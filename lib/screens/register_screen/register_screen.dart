import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/core/utils/validation_functions.dart';
import 'package:albus/screens/register_screen/controller/register_controller.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:albus/widgets/custom_phone_number.dart';
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
              height: SizeUtils.height,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.h,
                    vertical: 77.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        onTap: backButton,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Get Started',
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 26.v),
                      Text(
                        'Let us know who you are',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20.v),
                      _buildFullNameInput(),
                      SizedBox(height: 14.v),
                      _buildEmailInput(),
                      SizedBox(height: 14.v),
                      _buildConfirmEmailInput(),
                      SizedBox(height: 14.v),
                      _buildPasswordInput(),
                      SizedBox(height: 14.v),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 4.h),
                        child: _buildPhoneNumber(),
                      ),
                      const Spacer(),
                      _buildContinueButton()
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

  Widget _buildFullNameInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: CustomTextFormField(
        controller: controller.fullNameInputController,
        hintText: 'Full Name',
        validator: (value) {
          if (!isText(value)) {
            return 'Enter a valid name';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEmailInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: CustomTextFormField(
        controller: controller.emailInputController,
        hintText: 'Email',
        validator: (value) {
          if (!isValidEmail(value)) {
            return 'Enter a valid email';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmEmailInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: CustomTextFormField(
        controller: controller.confirmEmailInputController,
        hintText: 'Confirm Email',
        validator: (value) {
          if (value != controller.emailInputController.text) {
            return 'Emails do not match';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Obx(
        () => CustomTextFormField(
            controller: controller.passwordInputController,
            hintText: 'Password',
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                controller.isShowPassword.value =
                    !controller.isShowPassword.value;
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
              if (value == null ||
                  (!isValidPassword(value, isRequired: false))) {
                return 'Please enter a valid password';
              }
              return null;
            },
            obscureText: controller.isShowPassword.value,
            contentPadding: EdgeInsets.all(15.h)),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Obx(
        () => CustomPhoneNumber(
          controller: controller.phoneNumberInputController,
          country: controller.country.value,
          onTap: (country) {
            controller.country.value = country;
          },
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return CustomElevatedButton(
      text: 'Continue',
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Get.toNamed('/otp');
          // Perform registration
        }
      },
    );
  }

  void backButton() {
    Get.back();
  }
}
