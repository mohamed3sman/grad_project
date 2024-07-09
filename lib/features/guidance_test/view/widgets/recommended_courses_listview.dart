import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';
import 'package:linkin/features/home/view/widgets/custom_bottom_recommended.dart';
import 'package:linkin/config/utils/assets.dart';

class RecommendedCoursesList extends StatelessWidget {
  RecommendedCoursesList({
    super.key,
  });
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GetBuilder<GuidanceController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: controller.guidancCourses?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomBottomRecommended(
                image: AssetsData.java,
                courseName: controller.guidancCourses![index].name ?? 'No name',
                courseDecription:
                    controller.guidancCourses![index].description ??
                        'No description',
                coursePrice: controller.guidancCourses![index].price.toString(),
                level: controller.guidancCourses![index].level.toString(),
                onDelete: () {
                  apiService.deleteCourses(
                      controller.guidancCourses![index].id!.toString());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
