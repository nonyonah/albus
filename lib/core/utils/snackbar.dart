import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message, {Color? color}) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: color ?? Colors.black,
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
