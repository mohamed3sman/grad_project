import 'package:get/get.dart';
import 'package:linkin/features/skill_sharing/skillsharingmodel/datum.dart';

class SkillSharingController extends GetxController {
  num? currentid;
  List<Datum> users = [];
  bool? isLoading = false;
}
