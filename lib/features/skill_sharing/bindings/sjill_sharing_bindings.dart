import 'package:get/get.dart';
import 'package:linkin/features/skill_sharing/controller/sjill_sharing_controller.dart';

class SkillSharingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SkillSharingController());
  }
}
