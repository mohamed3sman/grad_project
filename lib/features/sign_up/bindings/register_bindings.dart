import 'package:get/get.dart';
import 'package:linkin/features/sign_up/controller/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
