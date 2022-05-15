import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  late TextEditingController signupemailController, signupPasswordController;
  final TextEditingController kiran = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    signupemailController = TextEditingController();
    signupPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    signupemailController.dispose();
    signupPasswordController.dispose();
  }

  ///To checking   the email field is empty or not
  String? validateEmail(String? signupemailController) {
    if (signupemailController == null || signupemailController.isEmpty) {
      return 'Email  addrees is required';
    }

    return null;
  }

//To checking the password field is empty or not
  String? validatePassword(String? signupPasswordController) {
    if (signupPasswordController == null || signupPasswordController.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
