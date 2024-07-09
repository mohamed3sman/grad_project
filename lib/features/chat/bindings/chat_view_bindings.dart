import 'package:get/get.dart';
import 'package:linkin/features/chat/controller/chat_view_controller.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
