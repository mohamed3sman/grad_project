import 'package:get/get.dart';
import 'package:linkin/features/profile_user_corse/controller/profile_user_course_controller.dart';

class ProfileUserCourseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileUserCourseController);
  }
}
