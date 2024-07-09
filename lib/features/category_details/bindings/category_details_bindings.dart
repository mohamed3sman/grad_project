import 'package:get/get.dart';
import 'package:linkin/features/add_course/controller/add_course_controller.dart';
import 'package:linkin/features/category_details/controller/category_details_controller.dart';

class CategoryDatilsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryDatilsController());
    Get.lazyPut(() => AddCourseController());
  }
}
