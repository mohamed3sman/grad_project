import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/config/utils/public_controller.dart';
import 'package:linkin/features/add_course/view/widgets/custom_text_field.dart';

class CourseLessonsView extends StatelessWidget {
  const CourseLessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Course Content",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Lessons",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              text: 'Lesson 1',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              text: 'Lesson 2',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              text: 'Lesson 3',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              text: 'Lesson 4',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              text: 'Lesson 5',
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                  width: 353,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xff4547EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                      onPressed: () async {
                        Get.find<PublicController>().isLoading = true;
                        await ApiService().createCourse();
                        await ApiService().getAllCourses();
                        Get.find<PublicController>().isLoading = false;
                        Get.toNamed(Routes.home);
                      },
                      child: const Text(
                        "Publish Course",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
