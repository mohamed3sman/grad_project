import 'package:get/get.dart';
import 'package:linkin/features/course_details/controller/course_details_controller.dart';

class CourseDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseDetailsController());
  }
}
