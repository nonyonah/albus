import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pushNamed(
    String routeName, {
    Map<String, dynamic>? queryParameters,
    Object? extra,
  }) {
    navigatorKey.currentContext?.pushNamed(
      routeName,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void goBack() {
    navigatorKey.currentContext?.pop();
  }

  static void pushNamedAndRemoveUntil(
    String routeName, {
    Map<String, dynamic>? queryParameters,
    Object? extra,
  }) {
    navigatorKey.currentContext?.goNamed(
      routeName,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void popAndPushNamed(
    String routeName, {
    Map<String, dynamic>? queryParameters,
    Object? extra,
  }) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      context.pop();
      context.pushNamed(
        routeName,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }
}