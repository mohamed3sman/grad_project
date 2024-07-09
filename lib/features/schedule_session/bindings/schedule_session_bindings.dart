import 'package:get/get.dart';
import 'package:linkin/features/schedule_session/controller/schedule_session_controller.dart';

class ScheduleSessionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleSessionController());
  }
}
