import 'package:albus/core/utils/pref_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
  }
}