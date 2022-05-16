import 'package:crud_app_flutter/app/core/theme/app_colors.dart';
import 'package:crud_app_flutter/app/core/utils/progress_bar.dart';
import 'package:crud_app_flutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightyellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/flutter_ui_dev_logo.png',
              height: 120,
              width: 120,
            ),
          ),
          const SizedBox(height: 37),
          const ProgressBar(),
        ],
      ),
    );
  }
}
