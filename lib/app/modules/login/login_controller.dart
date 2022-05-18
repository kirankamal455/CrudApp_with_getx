import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController loginEmailController, passwordController;
  final validator1 = ValidationBuilder().email().maxLength(50).build();
  final validator2 = ValidationBuilder().build();
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
}
