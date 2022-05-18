import 'package:crud_app_flutter/app/global/widgets/elevated_button.dart';
import 'package:crud_app_flutter/app/global/widgets/text_field.dart';
import 'package:crud_app_flutter/app/modules/login/login_controller.dart';
import 'package:crud_app_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: controller.loginFormKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 80),
                const Heading(text: 'Login to your Account'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: controller.loginEmailController,
                    validator: controller.validator1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Email Id',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    validator: controller.validator2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Button(
                  key1: controller.loginFormKey,
                  text: 'Sign In',
                  state: true,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.signup);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
