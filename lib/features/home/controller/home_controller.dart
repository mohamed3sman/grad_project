import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/features/home/model/coursemodel/datum.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();
  String? userName;
  String? userEmail;
  String? token;
  List<Datum> courses = [];

  setUserName(String name) {
    userName = name;
    update();
  }

  setUserEmail(String email) {
    userEmail = email;
    update();
  }

  setCourses(List<dynamic> courses) {
    courses = courses;
    update();
  }

  getUserName() {
    return userName;
  }

  getUserEmail() {
    return userEmail;
  }

  Future getCourses() async {
    return courses;
  }
}
