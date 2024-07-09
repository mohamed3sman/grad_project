import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/config/utils/public_controller.dart';
import 'package:linkin/features/add_course/controller/add_course_controller.dart';
import 'package:linkin/features/category_details/controller/category_details_controller.dart';
import 'package:linkin/features/category_details/model/categorycourses/categorycourses.dart';
import 'package:linkin/features/confirm/confirm_view.dart';
import 'package:linkin/features/course_details/controller/course_details_controller.dart';
import 'package:linkin/features/course_lessons/controller/course_lessons_controller.dart';
import 'package:linkin/features/guidance_test/controller/guidance_controller.dart';
import 'package:linkin/features/guidance_test/recommendedcourses/recommendedcourses.dart';
import 'package:linkin/features/home/controller/home_controller.dart';
import 'package:linkin/features/home/model/coursemodel/coursemodel.dart';
import 'package:linkin/features/profile_user_corse/controller/profile_user_course_controller.dart';
import 'package:linkin/features/profile_user_corse/model/skillsharingprofile/skillsharingprofile.dart';
import 'package:linkin/features/schedule_session/controller/schedule_session_controller.dart';
import 'package:linkin/features/sign_up/controller/register_controller.dart';
import 'package:linkin/features/skill_sharing/controller/sjill_sharing_controller.dart';
import 'package:linkin/features/skill_sharing/skillsharingmodel/skillsharingmodel.dart';

class ApiService {
  final String baseUrl = 'https://792a0cbeab6b8d.lhr.life';
  String? token;
  String? name;
  String? email;

  Future<void> signUp(String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/signup');
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'User.User'
    };
    final body = json.encode({
      'username': username,
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data['msg'] == 'User is already exists') {
          Get.snackbar('Error', 'This user already exists',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              isDismissible: true,
              messageText: const Text(
                'This user already exists',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ));
        } else {
          Get.snackbar('Success', 'Registered successfully',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              isDismissible: true,
              messageText: const Text(
                'Registered successfully',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ));
          Get.find<RegisterController>().usernameController.clear();
          Get.find<RegisterController>().emailController.clear();
          Get.find<RegisterController>().passwordController.clear();
        }
      } else {
        Get.snackbar('Error', 'Oops! Please try again',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            isDismissible: true,
            messageText: const Text(
              'Oops! Please try again',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ));
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'User.User',
    };
    final body = json.encode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      token = data['token'];
      Get.find<PublicController>().token = token;
      Get.find<HomeController>().token = token;
      debugPrint(token);

      if (response.statusCode == 200) {
        if (data['msg'] == 'email or password not found') {
          Get.snackbar('Error', 'Invalid email or password',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              isDismissible: true,
              messageText: const Text(
                'Invalid email or password',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ));
        } else {
          Get.toNamed(Routes.home);
        }
      } else {
        Get.snackbar('Error', 'Oops! Please try again',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            isDismissible: true,
            messageText: const Text(
              'Oops! Please try again',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> profile() async {
    final url = Uri.parse('$baseUrl/profile');
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'User.User',
      'token': '$token',
    };

    try {
      final response =
          await http.post(url, headers: headers, body: json.encode({}));
      final data = json.decode(response.body);
      name = data['data']['name'];
      email = data['data']['email'];
      Get.find<PublicController>().id = data['data']['id'];

      if (response.statusCode == 200) {
        debugPrint('token: $token');
        Get.find<PublicController>().name = name;
        Get.find<PublicController>().email = email;
        Get.find<PublicController>().update();
        Get.find<HomeController>().setUserName(name ?? '');
        Get.find<HomeController>().setUserEmail(email ?? '');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Creatingcoursemodel?> getAllCourses() async {
    final headers = {
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'Courses.Courses',
      'token': '${Get.find<PublicController>().token}',
      'operation': 'read_all',
    };

    final url = Uri.parse('$baseUrl/main');

    try {
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Creatingcoursemodel courseModel = Creatingcoursemodel.fromJson(data);
        Get.find<HomeController>().courses = courseModel.data ?? [];
        Get.find<HomeController>().update();
        return Creatingcoursemodel.fromJson(data);
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<void> createCourse() async {
    Get.lazyPut(() => AddCourseController());
    Get.lazyPut(() => CourseDetailsController());
    Get.lazyPut(() => CourseLessonsController());
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'Courses.Courses',
      'token': '${Get.find<PublicController>().token}',
      'operation': 'create',
    };

    final url = Uri.parse('$baseUrl/main');

    final body = {
      "category": Get.find<AddCourseController>().courseFieldController.text,
      "name": Get.find<AddCourseController>().courseNameController.text, //
      "price": Get.find<AddCourseController>().coursePriceController.text, //
      "description":
          Get.find<AddCourseController>().courseDescriptionController.text, //
      "instructor_id": "1", //
      "level": Get.find<AddCourseController>().courseLevelController.text, //
      "learning": [
        Get.find<CourseDetailsController>().objective1Controller.text,
        Get.find<CourseDetailsController>().objective2Controller.text,
        Get.find<CourseDetailsController>().objective3Controller.text,
      ], //
      "requirements": [
        Get.find<CourseDetailsController>().requirement1Controller.text,
        Get.find<CourseDetailsController>().requirement2Controller.text,
      ], //
      "course_content": [
        {
          "lessons": [
            {
              "link": Get.find<CourseLessonsController>().lesson1Controller.text
            },
            {
              "link": Get.find<CourseLessonsController>().lesson2Controller.text
            },
            {
              "link": Get.find<CourseLessonsController>().lesson3Controller.text
            },
            {
              "link": Get.find<CourseLessonsController>().lesson4Controller.text
            },
            {
              "link": Get.find<CourseLessonsController>().lesson5Controller.text
            },
          ] //
        },
      ]
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body), // Convert the body to a JSON string
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        debugPrint(data['id'].toString());
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return;
    }
  }

  Future<Categorycourses?> filterCourses(String? category) async {
    Get.lazyPut(() => CategoryDatilsController());

    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'Courses.Courses',
      'token': '${Get.find<PublicController>().token}',
      'operation': 'read_by_filter',
    };
    Get.find<CategoryDatilsController>().category = category ?? '';
    Get.find<CategoryDatilsController>().update();

    final url = Uri.parse('$baseUrl/main');

    final body = {"category": category};

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Categorycourses courseModel = Categorycourses.fromJson(data);
        Get.find<CategoryDatilsController>().categoryCourses =
            courseModel.data ?? [];
        Get.find<CategoryDatilsController>().update();
        return Categorycourses.fromJson(data);
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<bool> deleteCourses(String id) async {
    Map<String, String> headers = {
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'model': 'Cources.Cources',
      'token': '${Get.find<HomeController>().token}',
      'operation': 'delete_record',
    };

    final url = Uri.parse('$baseUrl/main');

    try {
      final response = await http.post(url, headers: headers, body: {"id": id});

      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Failed to load courses. Status code: ${response.body}');

        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  Future<Skillsharingmodel?> skillSharing() async {
    Get.lazyPut(() => SkillSharingController());

    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'token': '${Get.find<PublicController>().token}',
    };

    final url = Uri.parse('$baseUrl/skill_sharing');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Skillsharingmodel usersModel = Skillsharingmodel.fromJson(data);
        Get.find<SkillSharingController>().users = usersModel.data!
            .where((user) => user.model == 'Instructor')
            .toList();
        Get.find<SkillSharingController>().update();
        return Skillsharingmodel.fromJson(data);
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<ProfileUserCourse?> skillSharingProfile(num? currentId) async {
    Get.lazyPut(() => ProfileUserCourseController());
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'token': '${Get.find<PublicController>().token}',
    };

    final url = Uri.parse('$baseUrl/skill_sharing_profile');

    final body = {"model": "Instructor.Instructor", "id": currentId};

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        ProfileUserCourse profileModel = ProfileUserCourse.fromJson(data);
        Get.find<ProfileUserCourseController>().instData = profileModel.data;
        Get.find<ProfileUserCourseController>().schedulerSessions =
            profileModel.data?.schedulerSessions ?? [];

        Get.find<ProfileUserCourseController>().categories =
            profileModel.data?.category ?? [];
        Get.find<ProfileUserCourseController>().followersId = profileModel
            .data!.followersObject!
            .map((follower) => follower['id'])
            .toList();
        Get.find<ProfileUserCourseController>().update();
        return ProfileUserCourse.fromJson(data);
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<ProfileUserCourse?> skillSharingFollowing() async {
    Get.lazyPut(() => SkillSharingController());
    Get.lazyPut(() => PublicController());
    Get.lazyPut(() => ProfileUserCourseController());
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'token': '${Get.find<PublicController>().token}',
    };

    final url = Uri.parse('$baseUrl/add_follower');

    final body = {
      "model": "Instructor.Instructor",
      "follower_id": Get.find<SkillSharingController>().currentid,
      "follower_data": {
        "name": Get.find<PublicController>().name,
        "id": Get.find<PublicController>().id
      }
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Map<String, dynamic> data = jsonDecode(response.body);
        Get.find<ProfileUserCourseController>()
                .followersId
                .contains(Get.find<PublicController>().id)
            ? Get.find<ProfileUserCourseController>().followed = true
            : Get.find<ProfileUserCourseController>().followed = false;
        Get.find<ProfileUserCourseController>().update();

        return null;
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<void> skillSharingSchedule() async {
    Get.lazyPut(() => SkillSharingController());
    Get.lazyPut(() => PublicController());
    Get.lazyPut(() => ScheduleSessionController());
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'token': '${Get.find<PublicController>().token}',
    };

    final url = Uri.parse('$baseUrl/scheduler_session');

    final body = {
      "model": "Instructor.Instructor",
      "user_inst_id": Get.find<SkillSharingController>().currentid,
      "scheduler_session_data": {
        "date": Get.find<ScheduleSessionController>().dateController.text,
        "time": Get.find<ScheduleSessionController>().timeController.text,
        "id": Get.find<PublicController>().id,
        "type": Get.find<ScheduleSessionController>().selectedValue,
        "status": "inporogress"
      }
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        //Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('Success');
        Get.to(() => const ConfirmmView());
        return;
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return;
    }
  }

  Future<Recommendedcourses?> recommendationCouurse() async {
    Get.lazyPut(() => SkillSharingController());
    Get.lazyPut(() => PublicController());
    Get.lazyPut(() => ScheduleSessionController());
    final headers = {
      'Content-Type': 'application/json',
      'auth': 'd546%5465&465-hSS551\$561956-254154SDSdD^W',
      'token': '${Get.find<PublicController>().token}',
      'model': 'Cources.Cources',
      'operation': 'update',
    };

    final url = Uri.parse('$baseUrl/recommendation_course');

    final body = {
      "data": {
        "Os": 80,
        "Algorithms": 40,
        "Programming_concepts": 75,
        "Software_engineering": 70,
        "Network": 40,
        "Electronics": 60,
        "Computer_architecture": 55,
        "Mathematics": 60,
        "Communication_skills": 75,
        "Hours_working_per_day": 8
      }
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('Success');
        Recommendedcourses guidanceModel = Recommendedcourses.fromJson(data);
        Get.find<GuidanceController>().guidancCourses = guidanceModel.data;
        Get.find<GuidanceController>().update();
        return Recommendedcourses.fromJson(data);
      } else {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
