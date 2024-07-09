import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseContentView extends StatelessWidget {
  const AddCourseContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_rounded)),
        title: const Text(
          "Course Content",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(),
    );
  }
}
