import 'package:albus/core/utils/pref_utils.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
  }
}