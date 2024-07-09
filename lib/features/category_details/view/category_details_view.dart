import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/utils/assets.dart';
import 'package:linkin/features/category_details/controller/category_details_controller.dart';
import 'package:linkin/features/home/view/widgets/custom_bottom_recommended.dart';

class CategoryDatilsView extends StatelessWidget {
  const CategoryDatilsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          Get.find<CategoryDatilsController>().category ?? '',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: GetBuilder<CategoryDatilsController>(
        builder: (controller) => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.categoryCourses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 30),
                child: CustomBottomRecommended(
                  inProject: true,
                  image: AssetsData.java,
                  courseName:
                      controller.categoryCourses[index].name ?? 'No name',
                  courseDecription:
                      controller.categoryCourses[index].description ??
                          'No description',
                  coursePrice:
                      controller.categoryCourses[index].price.toString(),
                  level: controller.categoryCourses[index].level.toString(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
