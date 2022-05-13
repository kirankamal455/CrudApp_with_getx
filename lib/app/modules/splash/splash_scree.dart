import 'package:crud_app_flutter/app/global/widgets/progress_bar.dart';
import 'package:crud_app_flutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final storeController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD600),
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
