import 'package:get/get.dart';
import 'package:linkin/features/home/controller/home_controller.dart';
import 'package:linkin/features/sign_in/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
  }
}
