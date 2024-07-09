import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  final ApiService apiService = ApiService();
  var loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    isLoading = true;
    update();
    await apiService.login(
      email,
      password,
    );
    await apiService.profile();

    isLoading = false;
    update();
  }

  submit(String email, String password) async {
    if (loginFormKey.currentState!.validate()) {
      await login(email, password);
    }
  }
}
