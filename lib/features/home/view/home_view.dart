import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/community/view/community_view.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';
import 'package:linkin/features/guidance_test/view/widgets/recommended_courses_listview.dart';
import 'package:linkin/features/home/controller/home_controller.dart';
import 'package:linkin/features/home/view/widgets/categorie_list_view1.dart';
import 'package:linkin/features/home/view/widgets/categorie_list_view2.dart';
import 'package:linkin/features/home/view/widgets/categorie_list_view3.dart';

import 'package:linkin/features/home/view/widgets/custom_body_home.dart';
import 'package:linkin/features/home/view/widgets/custom_contianer_home.dart';
import 'package:linkin/features/home/view/widgets/custom_desian_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    ApiService().getAllCourses();
    ApiService().recommendationCouurse();
    Get.find<HomeController>().getCourses();
    Get.find<GuidanceController>().getCourses();
    Get.find<HomeController>().update();
    Get.find<GuidanceController>().update();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const CustomBodyHome(),
            const SizedBox(
              height: 40,
            ),
            const CustomContianerHome(),
            const SizedBox(
              height: 15,
            ),
            const CustomDesianHome(
              text: "Categories",
              titel: "View All",
            ),
            const SizedBox(
              height: 5,
            ),
            const CategoriesListView1(),
            const SizedBox(
              height: 5,
            ),
            const CategoriesListView2(),
            const SizedBox(
              height: 15,
            ),
            const CustomDesianHome(
              text: "Recommended For You",
              titel: "View All",
            ),
            RecommendedCoursesList(),
            const SizedBox(
              height: 15,
            ),
            const CustomDesianHome(
              text: "Most Popular",
              titel: "View All",
            ),
            CategoriesListView3(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0xffC6C6C6),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color(0xff4547EB),
              color: Colors.grey,
              tabs: [
                const GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.people_alt,
                  text: 'Community',
                  onPressed: () {
                    Get.to(() => const CommunityView());
                  },
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  onPressed: () {
                    Get.toNamed(Routes.settings);
                  },
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
