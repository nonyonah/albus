import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieService {
  static final LottieService _instance = LottieService._internal();

  factory LottieService() {
    return _instance;
  }

  LottieService._internal();

  late OverlayEntry _overlayEntry;
  bool _isLoading = false;

  void showLoadingAnimation(BuildContext context) {
    if (_isLoading) return;

    _isLoading = true;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry);
  }

  void hideLoadingAnimation() {
    if (!_isLoading) return;

    _isLoading = false;
    _overlayEntry.remove();
  }
}