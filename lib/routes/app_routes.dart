import 'package:flutter/material.dart';
import '../ui/account_connect_screen/account_connect_screen.dart';
import '../ui/import_address_screen/import_address_screen.dart';
import '../ui/signup_screen/signup_screen.dart';

class AppRoutes {
  static const String signUpScreen = '/signup';
  static const String accountConnectScreen = '/account';
  static const String importAddressScreen = '/importAddress';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    signUpScreen: (context) => const SignUpScreen(),
    accountConnectScreen: (context) => const AccountConnectScreen(),
    importAddressScreen: (context) => const ImportAddressScreen(),
    initialRoute: (context) => const ImportAddressScreen(),
  };
}
