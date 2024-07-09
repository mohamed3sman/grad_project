import 'package:get/get.dart';
import 'package:linkin/features/reward_view/controller/reward_view_controller.dart';

class RewardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardViewController());
  }
}
