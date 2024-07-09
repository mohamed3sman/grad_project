import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/utils/assets.dart';
import 'package:linkin/features/course_content/view/course_content_view.dart';
import 'package:linkin/features/home/controller/home_controller.dart';
import 'package:linkin/features/home/view/widgets/custom_bottom_recommended.dart';
import 'package:linkin/features/overview/controller/overview_controller.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});

  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Project Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consec adipiscing elit, dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer lorem ipsum adipiscing elit, dolore magna aliquam erat volutpat....more",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696767)),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "All Projects",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.courses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.find<OverviewController>().course =
                          controller.courses[index];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CourseContentView(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CustomBottomRecommended(
                        inProject: true,
                        image: AssetsData.java,
                        courseName: controller.courses[index].name ?? 'No name',
                        courseDecription:
                            controller.courses[index].description ??
                                'No description',
                        coursePrice: controller.courses[index].price.toString(),
                        level: controller.courses[index].level.toString(),
                        onDelete: () {
                          apiService.deleteCourses(
                              controller.courses[index].id!.toString());
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
