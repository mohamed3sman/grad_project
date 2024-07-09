import 'package:flutter/material.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/features/guidance_test/view/widgets/custom_slider_widget.dart';
import 'package:linkin/features/guidance_test/view/widgets/recommended_courses.dart';

class GuidanceTest extends StatefulWidget {
  const GuidanceTest({super.key});

  @override
  State<GuidanceTest> createState() => _GuidanceTestState();
}

class _GuidanceTestState extends State<GuidanceTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guidance Test",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomSliderWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xff4547EB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                  onPressed: () async {
                    await ApiService().recommendationCouurse();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecommendedCoursesView(),
                        ));
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
