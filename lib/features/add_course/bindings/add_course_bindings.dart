import 'package:get/get.dart';
import 'package:linkin/features/add_course/controller/add_course_controller.dart';

class AddCourseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCourseController());
  }
}
