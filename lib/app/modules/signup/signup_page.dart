import 'package:crud_app_flutter/app/global/widgets/elevated_button.dart';
import 'package:crud_app_flutter/app/global/widgets/text_field.dart';
import 'package:crud_app_flutter/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signUpConroller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Form(
        key: signUpConroller.signUpFormKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 80),
              const Heading(text: 'Register'),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: signUpConroller.emailController,
                  validator: signUpConroller.validateEmail,
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
                  controller: signUpConroller.passwordController,
                  validator: signUpConroller.validatePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Button(
                emailController: signUpConroller.emailController,
                key1: signUpConroller.signUpFormKey,
                passwordController: signUpConroller.passwordController,
                text: 'Sign Up',
                state: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
