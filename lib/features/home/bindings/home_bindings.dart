import 'package:get/get.dart';
import 'package:linkin/config/utils/public_controller.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';
import 'package:linkin/features/home/controller/home_controller.dart';
import 'package:linkin/features/overview/controller/overview_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OverviewController());
    Get.lazyPut(() => PublicController());
    Get.lazyPut(() => GuidanceController());
  }
}
