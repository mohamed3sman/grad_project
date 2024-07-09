import 'package:get/get.dart';
import 'package:linkin/config/utils/public_controller.dart';
import 'package:linkin/features/course_lessons/controller/course_lessons_controller.dart';

class CourseLessonsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseLessonsController());
    Get.lazyPut(() => PublicController());
  }
}
