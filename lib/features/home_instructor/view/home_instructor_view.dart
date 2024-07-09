import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/config/utils/assets.dart';

import '../../home/view/widgets/custom_body_home.dart';

class HomeInstructorView extends StatelessWidget {
  const HomeInstructorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomBodyHome(),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "My courses",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // Center(child: Image.asset(AssetsData.undrawno)),
          // const SizedBox(
          //   height: 50,
          // ),
          // const Center(
          //   child: Text(
          //     "You Have No Courses Yet",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AssetsData.java,
                    width: double.infinity,
                    height: 210,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ui Ux course',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "1200 EGP",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff696767),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text('4.7',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff696767))),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 17,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 17,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 17,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 17,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStarHalf, // استخدام أيقونة النجمة الممتلئة
                            size: 17,
                            color: Colors.amber),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "(23,100)",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
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
                    Get.toNamed(Routes.addCourse);
                  },
                  child: const Text(
                    "Add Course",
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
    );
  }
}
