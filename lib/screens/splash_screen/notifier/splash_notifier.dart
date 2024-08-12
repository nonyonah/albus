import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:albus/screens/splash_screen/models/splash_model.dart';
part 'splash_state.dart';

final splashNotifier = StateNotifierProvider<SplashNotifier, SplashState>(
    (ref) => SplashNotifier(SplashState(
          splashModelObj: const SplashModel(),
        ),),);

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier(super.state);
}
