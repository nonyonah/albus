import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/navigator_service.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/core/utils/validation_functions.dart';
import 'package:albus/screens/register_screen/provider/register_provider.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:albus/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: const RegisterScreen(),
    );
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 77,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 24,
                        width: 24,
                        onTap: () => onTapBackImgArrow(context),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Register',
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 29),
                      Container(
                        width: 282,
                        margin: const EdgeInsets.only(right: 95),
                        child: Text(
                          'Enter your email address and password here',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            height: 1.38,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: Selector<RegisterProvider, TextEditingController?>(
                          selector: (context, provider) => provider.emailInputController,
                          builder: (context, emailInputController, child) {
                            return CustomTextFormField(
                              controller: emailInputController,
                              hintText: 'Email address',
                              hintStyle: CustomTextStyle.titleMediumInterTightPrimary,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || !isValidEmail(value, isRequired: true)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              border: TextFormFieldStyleHelper.outlineOnPrimary,
                              filled: true,
                              fillColor: theme.colorScheme.surface,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: Selector<RegisterProvider, TextEditingController?>(
                          selector: (context, provider) => provider.passwordInputController,
                          builder: (context, passwordInputController, child) {
                            return CustomTextFormField(
                              controller: passwordInputController,
                              hintText: 'Enter password',
                              hintStyle: CustomTextStyle.titleMediumInterTightPrimary,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'Please enter a valid password';
                                }
                                return null;
                              },
                              border: TextFormFieldStyleHelper.outlineOnPrimary,
                              filled: true,
                              fillColor: theme.colorScheme.surface,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      CustomElevatedButton(
                        text: 'Continue',
                        margin: const EdgeInsets.symmetric(horizontal: 13),
                        alignment: Alignment.center,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Handle form submission
                          }
                        },
                      ),
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

  void onTapBackImgArrow(BuildContext context) {
    NavigatorService.goBack();
  }
}
