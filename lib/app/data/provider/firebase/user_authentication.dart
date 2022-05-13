import 'package:crud_app_flutter/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ValidateEmailAndPassword {
  final String emailController;
  final String passwordController;

  bool? state;
  GlobalKey<FormState> key;
  ValidateEmailAndPassword(
      {required this.emailController,
      required this.passwordController,
      required this.key,
      this.state});
  String errorMessage = '';

  void userSignInAndSighnUp() async {
    if (key.currentState!.validate()) {
      try {
        if (state == true) {
          //validation of signing
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailController, password: passwordController)
              .then(
            (value) {
              Get.offAllNamed(Routes.home);
            },
          );
          //validation of signup
        } else {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController, password: passwordController)
              .then(
            (value) {
              Get.offAllNamed(Routes.home);
            },
          );
        }
        errorMessage = '';
      } on FirebaseAuthException catch (e) {
        errorMessage = e.code;
        //An error from the firbase will trigger the snack bar
        Get.rawSnackbar(
          message: errorMessage,
          backgroundColor: Colors.red,
        );
      }
    }
  }
}

//Sign-out functionality
void signOutUser(BuildContext ctx) {
  FirebaseAuth.instance
      .signOut()
      .then((value) => Get.offAllNamed(Routes.login));
}
