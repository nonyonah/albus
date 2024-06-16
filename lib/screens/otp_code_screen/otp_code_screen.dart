import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/otp_code_screen/controller/otp_controller.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/themes/custom_button_style.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:albus/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OtpCodeScreen extends GetWidget<OtpCodeController> {
  const OtpCodeScreen({super.key});

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.height,
          padding: EdgeInsets.only(
            left: 26.h,
            top: 54.v,
            right: 26.h,
          ),
          child: Column(
            children: [_buildVerificationSection(), 
            SizedBox(height: 4.v,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpCodeInput() {
    return CustomTextFormField(
      controller: controller.otpController,
      hintText: '000-000',
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildVerificationSection() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              'Confirm your email address',
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 26.v),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                'Enter the code we sent you so that we can verify your email address',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(
                  height: 1.38,
                )
              ),
            ),
            SizedBox(height: 30.v),
            _otpCodeInput(),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't recieve a code?",
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(width: 8.h),
                  CustomElevatedButton(
                    height: 22.v,
                    width: 54.h,
                    text: 'Resend',
                    buttonStyle: CustomButtonStyles.fillPrimaryTL11,
                    buttonTextStyle: theme.textTheme.labelMedium!,
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.v),
            CustomElevatedButton(
              text: 'Continue',
              margin: EdgeInsets.only(
                left: 12.h,
                right: 6.h,
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 30.v),
          ],
        ),
        
      ),
    );
  }
  void onTapImgBackArrow() {
    Get.back();
  }
}

