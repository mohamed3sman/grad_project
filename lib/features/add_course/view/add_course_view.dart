import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/add_course/controller/add_course_controller.dart';
import 'package:linkin/features/add_course/view/widgets/custom_text_field.dart';

class AddCourseView extends StatelessWidget {
  const AddCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Course",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GetBuilder<AddCourseController>(
          builder: (controller) => ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                text: "Course Name",
                controller: controller.courseNameController,
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xffC6C6C6),
                    width: 1.5,
                  ),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  value: controller.dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]!),
                  items: controller.courseFieldsList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.dropdownvalue = newValue!;
                    controller.courseFieldController.text = newValue;
                    controller.update();
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                text: "Description",
                controller: controller.courseDescriptionController,
              ),
              const SizedBox(height: 20),
              const Text(
                "Course Level",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GetBuilder<AddCourseController>(
                builder: (controller) => Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        Radio<int>(
                          value: 1,
                          groupValue: controller.selectedValue,
                          onChanged: controller.handleRadioValueChange,
                        ),
                        const Text('Beginner'),
                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        Radio<int>(
                          value: 2,
                          groupValue: controller.selectedValue,
                          onChanged: controller.handleRadioValueChange,
                        ),
                        const Text('Mediate'),
                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        Radio<int>(
                          value: 3,
                          groupValue: controller.selectedValue,
                          onChanged: controller.handleRadioValueChange,
                        ),
                        const Text('Advanced'),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: "Course Price",
                hasEndText: true,
                controller: controller.coursePriceController,
              ),
              const SizedBox(
                height: 180,
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
                        Get.toNamed(Routes.courseDetails);
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
