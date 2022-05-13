import 'dart:async';

import 'package:crud_app_flutter/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 2), () {
      isUserisLogedOrnot();
    });
  }

  void isUserisLogedOrnot() async {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      Get.offAllNamed(Routes.login);
    } else {
      Get.offAllNamed(Routes.home);
    }
  }
}
