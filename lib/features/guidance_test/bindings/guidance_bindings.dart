import 'package:get/get.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';

class GuidanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuidanceController());
  }
}
