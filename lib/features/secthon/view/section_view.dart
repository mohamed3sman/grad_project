import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/features/overview/controller/overview_controller.dart';
import 'package:linkin/features/secthon/view/widgets/custom_section_body.dart';
import 'package:linkin/config/utils/assets.dart';

class SectionView extends StatelessWidget {
  const SectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<OverviewController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.course?.courseContent?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomSectionBody(
                    image: AssetsData.witch,
                    text: controller.course?.courseContent?[index]
                            .lessons?[index].link ??
                        'Lesson',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
