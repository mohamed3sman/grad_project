import 'package:get/get.dart';
import 'package:linkin/features/profile_user_corse/model/skillsharingprofile/data.dart';

class ProfileUserCourseController extends GetxController {
  Data? instData;
  List<dynamic> schedulerSessions = [];
  List<dynamic> categories = [];
  List<dynamic> followersId = [];
  String? message;
  bool? followingLoading = false;
  bool? followed = false;
}
