import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:linkin/features/skill_sharing/model/skill_sharing_model.dart';
import 'package:linkin/config/utils/assets.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';
import 'package:linkin/features/guidance_test/view/widgets/recommended_courses_listview.dart';
import 'package:linkin/features/home/view/widgets/custom_desian_home.dart';

class RecommendedCoursesView extends StatelessWidget {
  const RecommendedCoursesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GuidanceController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              Text(
                controller.guidancCourses?.first.category ?? '',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  AssetsData.check,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                "your suitable career is web developer you recommend you the below courses to start your learning journey",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              const Spacer(
                flex: 2,
              ),
              const CustomDesianHome(
                text: "Recommended Courses For You",
                titel: "",
              ),
              const SizedBox(
                height: 8,
              ),
              RecommendedCoursesList(),
              const Spacer(),
              Container(
                width: 353,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xff4547EB),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Return to home page",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
