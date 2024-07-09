import 'package:get/get.dart';
import 'package:linkin/features/instructor/controller/instructor_controller.dart';

class InstructorBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstructorController());
  }
}
