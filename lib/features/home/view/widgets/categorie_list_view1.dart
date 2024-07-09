import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/home/model/category_model.dart';
import 'package:linkin/features/home/view/widgets/custom_bottom.dart';
import 'package:linkin/config/utils/assets.dart';

class CategoriesListView1 extends StatelessWidget {
  const CategoriesListView1({
    super.key,
  });
  final List<CategoryModel> categorie = const [
    CategoryModel(image: AssetsData.ux, categoryname: "Ui Ux Design"),
    CategoryModel(image: AssetsData.web, categoryname: "Web Develop..."),
    CategoryModel(image: AssetsData.app, categoryname: "Mobile Devel..."),
    CategoryModel(image: AssetsData.cyber, categoryname: "Cyber Securit..."),
    CategoryModel(image: AssetsData.social, categoryname: "Digital Marke..."),
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
                      ? 'Ui Ux Design'
                      : index == 1
                          ? 'Web Development'
                          : index == 2
                              ? 'Mobile Development'
                              : index == 3
                                  ? 'Cyber Security'
                                  : 'Digital Marketing');

                  Get.toNamed(Routes.categoryDetails);
                },
                child: CustomBottom(categorymodel: categorie[index]));
          }),
    );
  }
}
