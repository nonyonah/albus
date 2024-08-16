import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/navigator_service.dart';
import '../../core/utils/validation_functions.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
              height: SizeUtils.screenHeight,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.h,
                    vertical: 76.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 24.h,
                        width: 24.h,
                        alignment: Alignment.centerLeft,
                        onTap: () {
                          onTapGoBack(context);
                        },
                      ),
                      SizedBox(height: 46.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Get Started',
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Let us know who you are',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _buildFullNameInput(context),
                      SizedBox(height: 14.h),
                      _buildEmailAddress(context),
                      SizedBox(height: 14.h),
                      _buildConfirmEmailAddress(context),
                      SizedBox(height: 14.h),
                      _buildPasswordInput(context),
                      const Spacer(),
                      _buildContinueButton(context),
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

  Widget _buildFullNameInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(registerNotifier).fullNameInputController,
            hintText: 'Full name',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 20.h,
            ),
            validator: (value) {
              if (!isText(value)) {
                return 'Please enter valid text';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildEmailAddress(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(registerNotifier).emailInputController,
            hintText: 'Email Address',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 20.h,
            ),
            validator: (value) {
              if (value == null || !isValidEmail(value, isRequired: true)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildConfirmEmailAddress(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(registerNotifier).confirmEmailInputController,
            hintText: 'Confirm Email Address',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 20.h,
            ),
            validator: (value) {
              if (value == null || !isValidEmail(value, isRequired: true)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Consumer(
        builder: (context, ref, _) {
          final isPasswordVisible = ref.watch(registerNotifier).isShowPassword;
          return CustomTextFormField(
            controller: ref.watch(registerNotifier).passwordInputController,
            hintText: 'Enter password',
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                ref.read(registerNotifier.notifier).changePasswordVisibility();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(18.h, 12.h, 16.h, 12.h),
                child: CustomImageView(
                  imagePath: isPasswordVisible
                      ? ImageConstant.imgEyeClose // Closed eye icon
                      : ImageConstant.imgEyeOpen, // Open eye icon
                  height: 14.h,
                  width: 20.h,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 50.h,
            ),
            obscureText: !isPasswordVisible, // Show/hide password
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 20.h,
            ),
            validator: (value) {
              if (value == null || !isValidPassword(value, isRequired: true)) {
                return 'Please enter a valid password';
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final registrationStatus = ref.watch(registerNotifier).registrationStatus;
        final errorMessage = ref.watch(registerNotifier).errorMessage;

        return Column(
          children: [
            if (registrationStatus == RegistrationStatus.loading)
              CircularProgressIndicator(),
            if (errorMessage != null)
              Text(errorMessage, style: TextStyle(color: Colors.red)),
            CustomElevatedButton(
              text: 'Continue',
              margin: EdgeInsets.symmetric(horizontal: 12.h),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ref.read(registerNotifier.notifier).registerUser();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void onTapGoBack(BuildContext context) {
    NavigatorService.goBack();
  }
}
