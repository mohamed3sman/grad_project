import 'package:get/get.dart';
import 'package:linkin/features/add_course_contant/controller/add_course_contant_controller.dart';

class AddCourseContentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCourseContentController());
  }
}
