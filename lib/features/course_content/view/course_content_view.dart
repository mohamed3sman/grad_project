import 'package:flutter/material.dart';
import 'package:linkin/features/course_content/view/widgets/custom_app_bar_course.dart';
import 'package:linkin/features/course_content/view/widgets/custom_tab_bar_body.dart';
import 'package:linkin/config/utils/assets.dart';

import '../../content/view/content_view.dart';
import '../../overview/view/overview.dart';
import '../../projects/view/projects_view.dart';

class CourseContentView extends StatefulWidget {
  const CourseContentView({super.key});

  @override
  State<CourseContentView> createState() => _CourseContentViewState();
}

class _CourseContentViewState extends State<CourseContentView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 250,
          iconTheme: const IconThemeData(size: 0),
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 180),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(AssetsData.back)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 180),
              child: Image.asset(
                AssetsData.frame,
                width: 32,
                height: 32,
              ),
            ),
          ],
          flexibleSpace: const CustomAppBarCoures(),
          bottom: const CustomTabBarBody(),
        ),
        body: TabBarView(children: [
          const OverView(),
          const ContentView(),
          ProjectsView(),
        ]),
      ),
    );
  }
}
