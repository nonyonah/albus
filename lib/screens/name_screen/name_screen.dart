import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/core/utils/validation_functions.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:albus/widgets/custom_phone_number.dart';
import 'package:albus/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:albus/screens/name_screen/binding/name_binding.dart';
import 'package:albus/screens/name_screen/controller/name_controller.dart';
import 'package:albus/screens/name_screen/models/name_models.dart';
import 'package:country_pickers/country.dart';
import 'package:get/get.dart';

class NameScreen extends GetWidget<NameController> {
  NameScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                padding: EdgeInsets.only(
                  left: 26.h,
                  top: 54.v,
                  right: 26.h,
                ),
                child: Column(
                  children: [
                    _buildNameInputSection(),
                    SizedBox(height: 4.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameInput() {
    return CustomTextFormField(
      controller: controller.firstNameController,
      hintText: 'First Name',
      validator: (value) {
        if (!isText(value)) {
          return 'Enter a valid name';
        }
        return null;
      },
    );
  }

  Widget _buildLastNameInput() {
    return CustomTextFormField(
      controller: controller.lastNameController, // Corrected to lastNameController
      hintText: 'Last Name',
      validator: (value) {
        if (!isText(value)) {
          return 'Enter a valid name';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneNumberInput() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => CustomPhoneNumber(
          country: controller.selectedCountry.value,
          controller: controller.phoneNumberInputController,
          onTap: (Country value) {
            controller.selectedCountry.value = value;
          },
        ),
      ),
    );
  }

  Widget _buildNameInputSection() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.centerLeft,
              onTap: () {
                backButton();
              },
            ),
            SizedBox(height: 50.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What's your name?",
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: 28.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please type in your first and last name',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 54.v),
            _buildFirstNameInput(),
            SizedBox(height: 20.v),
            _buildLastNameInput(),
            SizedBox(height: 20.v),
            SizedBox(
              width: SizeUtils.width,
              child: _buildPhoneNumberInput(),
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Continue',
              margin: EdgeInsets.only(
                left: 12.h,
                right: 6.h,
              ),
              onPressed: () {
                        Get.toNamed('/createyourpassword');
                      },
            ),
            SizedBox(height: 60.v),
          ],
        ),
      ),
    );
  }

  void backButton() {
    Get.back();
  }
}
