import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  late TextEditingController signupemailController, signupPasswordController;
  final validator1 = ValidationBuilder().email().maxLength(50).build();
  final validator2 = ValidationBuilder().build();
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
}
