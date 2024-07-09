import 'package:get/get.dart';
import 'package:linkin/features/guidance_test/recommendedcourses/datum.dart';

class GuidanceController extends GetxController {
  double operatingSystemSlider = 20;
  double algorithmsSlider = 20;
  double programmingConceptsSlider = 20;
  double softwareEngineeringSlider = 20;
  double computerNetworksSlider = 20;
  double electronicsSlider = 20;
  double computerArchitectureSlider = 20;
  double mathematicsSlider = 20;
  double communicationSkillsSlider = 20;
  double skillsRatingSlider = 20;

  List<Datum>? guidancCourses = [];

  Future getCourses() async {
    return guidancCourses;
  }
}
