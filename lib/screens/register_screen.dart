import 'package:flutter/material.dart';
import 'package:myapp/core/utils/size_utils.dart';
import 'package:myapp/core/utils/validation_functions.dart';
import 'package:myapp/themes/custom_text_style.dart';
import 'package:myapp/themes/theme_helper.dart';
import 'package:myapp/widgets/custom_elevated_button.dart';
import 'package:myapp/widgets/custom_text_form.dart';
import 'package:myapp/screens/models/register_model.dart';
import 'package:myapp/screens/provider/register_provider.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
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
                      SizedBox(height: 21.v),
                      //CustomImageView(
                      //imagePath: ImageConstant.imgArrowLeft,
                      //height: 24.adaptSize,
                      //width: 24.adaptSize,
                      //onTap: () {
                      //onTapBackImgArrow(context);},
                      //),
                      SizedBox(height: 50.v),
                      Text(
                        'Register',
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 27.v),
                      Container(
                        width: 282.h,
                        margin: EdgeInsets.only(right: 95.h),
                        child: Text(
                          'Enter your email address and password here',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            height: 1.38,
                          ),
                        ),
                      ),
                      SizedBox(height: 33.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          right: 11.h,
                        ),
                        child:
                        Selector<RegisterProvider, TextEditingController?>(
                          selector: (context, provider) => provider.emailInputController,
                          builder: (context, emailInputController, child) {
                            return CustomTextFormField(
                              controller: emailInputController,
                              hintText: 'Email address',
                              hintStyle: CustomTextStyle.bodyMediumInterTightOnPrimaryContainer,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || 
                                (!isValidEmail(value, isRequired: true))) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 11.v,
                              ),
                              border:
                              TextFormFieldStyleHelper.outlineOnPrimary,
                              filled: true,
                              fillColor: appTheme.gray50,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 36.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          right: 11.h
                        ),
                        child: 
                        Selector<RegisterProvider, TextEditingController?>(
                          selector: (context, provider) => provider.passwordInputController,
                          builder: (context, passwordInputController, child) {
                            return CustomTextFormField(
                              controller: passwordInputController,
                              hintText: 'Enter password',
                              hintStyle: CustomTextStyle.bodyMediumInterTightOnPrimaryContainer,
                              textInputAction: TextInputAction.done,
                              textInputType:  TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || 
                                (!isValidEmail(value, isRequired: true))) {
                                  return 'Please enter valid password';
                                }
                                return null;
                              },
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 11.v,
                              ),
                              border:
                              TextFormFieldStyleHelper.outlineOnPrimary,
                              filled: true,
                              fillColor: appTheme.gray50,
                            );
                          }
                      ),
                      ),
                      Spacer(),
                      CustomElevatedButton(
                        text: 'Continue',
                        margin: EdgeInsets.only(
                          left: 13.h,
                          right: 11.h,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}