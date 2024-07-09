import 'package:get/get.dart';
import 'package:linkin/features/course_sections/controller/course_sections_controller.dart';

class CourseSectionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseSectionsController());
  }
}
