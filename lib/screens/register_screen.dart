import 'package:flutter/material.dart';
import 'package:myapp/core/utils/size_utils.dart';
import 'package:myapp/core/utils/validation_functions.dart';
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