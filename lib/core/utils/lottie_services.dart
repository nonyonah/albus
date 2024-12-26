import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Lottie.asset(
            'assets/animations/loading.json',
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
