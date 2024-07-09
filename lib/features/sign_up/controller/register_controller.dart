import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';

class RegisterController extends GetxController {
  bool isLoading = false;
  final ApiService apiService = ApiService();
  GlobalKey<FormState> fsignUpFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register(String userName, String email, String password) async {
    isLoading = true;
    update();
    await apiService.signUp(
      userName,
      email,
      password,
    );
    isLoading = false;
    update();
  }

  submit(String userName, String email, String password) async {
    if (fsignUpFormKey.currentState!.validate()) {
      await register(userName, email, password);
    }
  }
}
