import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/features/course_content/view/course_content_view.dart';
import 'package:linkin/features/home/controller/home_controller.dart';
import 'package:linkin/features/home/view/widgets/custom_bottom_recommended.dart';
import 'package:linkin/config/utils/assets.dart';
import 'package:linkin/features/overview/controller/overview_controller.dart';

class CategoriesListView3 extends StatelessWidget {
  CategoriesListView3({
    super.key,
  });
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GetBuilder<HomeController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: controller.courses.length,
            scrollDirection: Axis.horizontal,
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
                child: CustomBottomRecommended(
                  image: AssetsData.java,
                  courseName: controller.courses[index].name ?? 'No name',
                  courseDecription:
                      controller.courses[index].description ?? 'No description',
                  coursePrice: controller.courses[index].price.toString(),
                  level: controller.courses[index].level.toString(),
                  onDelete: () {
                    apiService.deleteCourses(
                        controller.courses[index].id!.toString());
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
