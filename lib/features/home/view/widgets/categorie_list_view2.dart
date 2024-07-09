import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/home/model/category_model.dart';
import 'package:linkin/features/home/view/widgets/custom_bottom.dart';
import 'package:linkin/config/utils/assets.dart';

class CategoriesListView2 extends StatelessWidget {
  const CategoriesListView2({
    super.key,
  });
  final List<CategoryModel> categorie = const [
    CategoryModel(image: AssetsData.machine, categoryname: "Machine Le..."),
    CategoryModel(image: AssetsData.data, categoryname: "Data Science"),
    CategoryModel(image: AssetsData.big, categoryname: "Big Data"),
    CategoryModel(image: AssetsData.analysis, categoryname: "System Analy..."),
    CategoryModel(image: AssetsData.server, categoryname: "Data Base"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorie.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () async {
                  await ApiService().filterCourses(index == 0
                      ? 'Machine Learning'
                      : index == 1
                          ? 'Data Science'
                          : index == 2
                              ? 'Big Data'
                              : index == 3
                                  ? 'System Analysis'
                                  : 'Data Base');
                  Get.toNamed(Routes.categoryDetails);
                },
                child: CustomBottom(categorymodel: categorie[index]));
          }),
    );
  }
}
