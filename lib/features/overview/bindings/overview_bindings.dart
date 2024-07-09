import 'package:get/get.dart';
import 'package:linkin/features/overview/controller/overview_controller.dart';

class OverviewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OverviewController());
  }
}
