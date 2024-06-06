import 'package:flutter/material.dart';
import 'package:myapp/screens/register_screen.dart';

class AppRoutes {
  static const String registerScreen = '/register_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    registerScreen: RegisterScreen.builder,
    initialRoute: RegisterScreen.builder
  };
}