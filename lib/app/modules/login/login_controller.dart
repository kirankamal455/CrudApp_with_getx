import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController loginEmailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    loginEmailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    passwordController.dispose();
  }

  ///To checking   the email field is empty or not
  String? validateEmail(String? emailController) {
    if (emailController == null || emailController.isEmpty) {
      return 'Email  addrees is required';
    }

    return null;
  }

//To checking the password field is empty or not
  String? validatePassword(String? passwordController) {
    if (passwordController == null || passwordController.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
