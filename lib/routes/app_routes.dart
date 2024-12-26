import 'package:flutter/material.dart';
import '../screens/account_connect_screen/account_connect_screen.dart';
import '../screens/signup_screen/signup_screen.dart';

class AppRoutes {
  static const String signUpScreen = '/signup';
  static const String accountConnectScreen = '/account';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    signUpScreen: (context) => const SignUpScreen(),
    accountConnectScreen: (context) => const AccountConnectScreen(),
    initialRoute: (context) => const AccountConnectScreen()
  };
}
