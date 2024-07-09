import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/config/router/app_routes.dart';
import 'package:linkin/config/utils/public_controller.dart';

void main() {
  Get.put(PublicController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.routes,
    );
  }
}
