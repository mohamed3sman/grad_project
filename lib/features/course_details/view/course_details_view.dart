import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/add_course/view/widgets/custom_text_field.dart';
import 'package:linkin/features/course_details/controller/course_details_controller.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

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
          "Add Course",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: GetBuilder<CourseDetailsController>(
          builder: (controller) => ListView(
            children: [
              const Text(
                "What will students learn in this course?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Enter at least 4 learning objectives.",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Objective 1',
                controller: controller.objective1Controller,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Objective 2',
                controller: controller.objective2Controller,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Objective 3',
                controller: controller.objective3Controller,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "What are the requirements for this course?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "List the required skills, tools, or experience learners should have before this course.",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Enter Requirement',
                controller: controller.requirement1Controller,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                text: 'Enter Requirement',
                controller: controller.requirement2Controller,
              ),
              const SizedBox(
                height: 30,
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
                      onPressed: () {
                        Get.toNamed(Routes.courseLessons);
                      },
                      child: const Text(
                        "Add Course",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
