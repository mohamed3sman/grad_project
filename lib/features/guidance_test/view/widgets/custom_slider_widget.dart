import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in operating systems',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.operatingSystemSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.operatingSystemSlider.round().toString(),
            onChanged: (double value) {
              controller.operatingSystemSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in algorithms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.algorithmsSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.algorithmsSlider.round().toString(),
            onChanged: (double value) {
              controller.algorithmsSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in programming concepts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.programmingConceptsSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.programmingConceptsSlider.round().toString(),
            onChanged: (double value) {
              controller.programmingConceptsSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in software engineering',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.softwareEngineeringSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.softwareEngineeringSlider.round().toString(),
            onChanged: (double value) {
              controller.softwareEngineeringSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in computer networks',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.computerNetworksSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.computerNetworksSlider.round().toString(),
            onChanged: (double value) {
              controller.computerNetworksSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in electronics subjects',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.electronicsSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.electronicsSlider.round().toString(),
            onChanged: (double value) {
              controller.electronicsSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in computer architecture',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.computerArchitectureSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.computerArchitectureSlider.round().toString(),
            onChanged: (double value) {
              controller.computerArchitectureSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in mathematics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.mathematicsSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.mathematicsSlider.round().toString(),
            onChanged: (double value) {
              controller.mathematicsSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'percentage in communication skills',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.communicationSkillsSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.communicationSkillsSlider.round().toString(),
            onChanged: (double value) {
              controller.communicationSkillsSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'coding skills rating',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<GuidanceController>(
          builder: (controller) => Slider(
            value: controller.skillsRatingSlider,
            min: 0,
            max: 100,
            divisions: 100,
            label: controller.skillsRatingSlider.round().toString(),
            onChanged: (double value) {
              controller.skillsRatingSlider = value;
              controller.update();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
